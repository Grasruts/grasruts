class CampaignController < ApplicationController
  
  before_action :authenticate_user!, except: [:new]
  before_action :set_initial_section, except: [:create]

  def new
    @campaign = Campaign.new
  end

  def show
  end

  def create
    if user_signed_in?
      @campaign = current_user.campaigns.create(name: params[:campaign][:name], category: params[:campaign][:category])
    else
      @campaign = Campaign.create({name: params[:campaign][:name], category: params[:campaign][:category]})
    end
    redirect_to edit_campaign_path(@campaign.id)
  end

  def edit
    redirect_to new_campaign_path unless is_owner_of_campaign?(params[:id]) 
    @campaign = Campaign.find params[:id]
    @campaign.update(user_id: current_user.id)
  end

  def update
    @campaign = Campaign.find params[:id]
    @campaign.attributes = campaign_param
    @campaign.save(context: params[:section].to_sym)
    redirect_to edit_campaign_path(@campaign.id, section: params[:section])
  end

  def rewards
    @rewards = Campaign.find_by_id(params[:id]).try(:rewards)
    render 'campaign/edit'
  end

  def kyc
    @user = current_user
    render 'campaign/edit'
  end

  private
  def campaign_param
    params.require(:campaign).permit(:name, :uri, :location, :category, :goal, :deadline, :about, :video, :card_description, :users_id)
  end

  def set_initial_section
    unless params.include? 'section'
      redirect_to "#{request.original_url}?section=basic"
    end
  end
end
