# frozen_string_literal: true

class CampaignController < ApplicationController
  before_action :authenticate_user!, except: %i[new show create]
  before_action :set_initial_section, except: %i[create index new publish show destroy]
  before_action :is_owner_of_campaign?, except: %i[create index new show]

  def index
    @campaigns = current_user.campaigns.kept.order(created_at: :desc).includes(:campaign_category).decorate
  end

  def new
    @campaign = Campaign.new
    @categories = CampaignCategory.all.order(:name)
  end

  def show
    @campaign = Campaign.find_by_uri(params[:permalink]).decorate
    @contributions = @campaign.contributions.includes(:user).where(state: 'success')
    @total_contributions = @contributions.sum(:amount)
    @total_contributors = @contributions.select('distinct on (user_id) *').length
  end

  def create
    if user_signed_in?
      @campaign = current_user.campaigns.create(name: params[:campaign][:name], campaign_category_id: params[:campaign][:campaign_category_id], uri: generate_code(10))
    else
      @campaign = Campaign.create(name: params[:campaign][:name], campaign_category_id: params[:campaign][:campaign_category_id], uri: generate_code(10))
      session[:campaign_id] = @campaign.uuid
    end
    redirect_to edit_campaign_path(@campaign.uuid)
  end

  def edit
    @campaign = Campaign.find_by_uuid params[:id]
    @campaign.update(user_id: current_user.id)
  end

  def update
    @campaign = Campaign.find_by_uuid params[:id]
    @campaign.attributes = campaign_param
    @campaign.save(context: params[:section].to_sym)
    flash[:error] = @campaign.errors.messages.values.flatten unless @campaign.errors.messages.empty?
    redirect_to edit_campaign_path(@campaign.uuid, section: params[:section])
  end

  def destroy
    @campaign = Campaign.find_by_uuid params[:id]
    if @campaign.status == 'online'
      @campaign.discard
    else
      @campaign.destroy
    end
    redirect_to campaign_index_path
  end

  def rewards
    @campaign = Campaign.find_by_uuid params[:id]
    @rewards = @campaign.try(:rewards)
    render 'campaign/edit'
  end

  def kyc
    @user = current_user
    @campaign = Campaign.find_by_uuid params[:id]
    render 'campaign/edit'
  end

  def news
    @campaign = Campaign.find_by_uuid params[:id]
    @news = @campaign.campaign_updates.kept
    render 'campaign/edit'
  end

  def faq
    @campaign = Campaign.find_by_uuid params[:id]
    @faqs = @campaign.faqs
    render 'campaign/edit'
  end

  def publish
    @campaign = Campaign.find_by_uuid params[:id]
    @campaign.status = Campaign.statuses[:online]
    @campaign.published_date = Time.now
    @campaign.save(context: %i[basic financing description project_card publish])
    unless @campaign.errors.messages.empty?
      flash[:error] = @campaign.errors.messages.values.flatten
      return redirect_back(fallback_location: root_path)
    end
    flash[:success] = 'You campaign is now online and ready to receive contributions'
    CampaignPublishRequestWorker.perform_async(params[:id])
    redirect_to project_by_slug_path(@campaign.uri)
  end

  private

  def campaign_param
    params.require(:campaign).permit(:name, :uri, :location, :goal, :deadline, :about, :video, :card_description, :card_image, :file, :users_id, :campaign_category_id)
  end

  def set_initial_section
    redirect_to "#{request.original_url}?section=basic" unless params.include? 'section'
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
end
