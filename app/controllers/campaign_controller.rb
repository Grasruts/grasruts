class CampaignController < ApplicationController
  before_action :authenticate_user!, except: %i[new froala_upload_image access_file show create]
  before_action :set_initial_section, except: %i[create index new froala_upload_image access_file publish show destroy]
  before_action :is_owner_of_campaign?, except: %i[create index new froala_upload_image access_file show]

  def index
    @campaigns = current_user.campaigns.kept.order(created_at: :desc).includes(:campaign_category).decorate
  end

  def new
    @campaign = Campaign.new
    @categories = CampaignCategory.all.order(:name)
  end

  def show
    @campaign = Campaign.find_by_uri(params[:permalink]).decorate
  end

  def create
    if user_signed_in?
      @campaign = current_user.campaigns.create(name: params[:campaign][:name], campaign_category_id: params[:campaign][:campaign_category_id], uri: generate_code(10))
    else
      @campaign = Campaign.create(name: params[:campaign][:name], campaign_category_id: params[:campaign][:campaign_category_id], uri: generate_code(10))
      session[:campaign_id] = @campaign.id
    end
    redirect_to edit_campaign_path(@campaign.id)
  end

  def edit
    @campaign = Campaign.find_by id: params[:id]
    @campaign.update(user_id: current_user.id)
  end

  def update
    @campaign = Campaign.find params[:id]
    @campaign.attributes = campaign_param
    @campaign.save(context: params[:section].to_sym)
    unless @campaign.errors.messages.empty?
      flash[:error] = @campaign.errors.messages.values.flatten
    end
    redirect_to edit_campaign_path(@campaign.id, section: params[:section])
  end

  def destroy
    binding.pry
    @campaign = Campaign.find_by_id params[:id]
    if @campaign.status == 'online'
      @campaign.discard
    else
      @campaign.destroy
    end
    redirect_to campaign_index_path
  end

  def rewards
    @campaign = Campaign.find_by(id: params[:id])
    @rewards = @campaign.try(:rewards)
    render 'campaign/edit'
  end

  def kyc
    @user = current_user
    @campaign = Campaign.find_by(id: params[:id])
    render 'campaign/edit'
  end

  def froala_upload_image
    FileUtils.mkdir_p(Rails.root.join('public/uploads/files'))
    ext = File.extname(params[:file].original_filename)
    file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
    path = Rails.root.join('public/uploads/files/', file_name)

    File.open(path, 'wb') { |f| f.write(params[:file].read) }
    view_file = Rails.root.join('/download_file/', file_name).to_s
    render json: { link: view_file }.to_json
  end

  def access_file
    if File.exist?(Rails.root.join('public', 'uploads', 'files', params[:name]))
      send_data File.read(Rails.root.join('public', 'uploads', 'files', params[:name])), disposition: 'attachment'
    else
      render nothing: true
    end
  end

  def publish
    @campaign = Campaign.find_by id: params[:id]
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
    unless params.include? 'section'
      redirect_to "#{request.original_url}?section=basic"
    end
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end
end
