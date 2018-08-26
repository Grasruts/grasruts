class CampaignController < ApplicationController
  
  before_action :authenticate_user!, except: [:new, :froala_upload_image, :access_file]
  before_action :set_initial_section, except: [:create, :index, :froala_upload_image, :access_file]
  before_action :is_owner_of_campaign?, except: [:create, :index, :new, :froala_upload_image, :access_file]

  def index
    @campaigns = current_user.campaigns
  end

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
    @campaign = Campaign.find_by_id params[:id]
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

  def rewards
    @rewards = Campaign.find_by_id(params[:id]).try(:rewards)
    render 'campaign/edit'
  end

  def kyc
    @user = current_user
    render 'campaign/edit'
  end

  def froala_upload_image
    FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
    ext = File.extname(params[:file].original_filename)
    file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
    path = Rails.root.join("public/uploads/files/", file_name)

    File.open(path, "wb") {|f| f.write(params[:file].read)}
    view_file = Rails.root.join("/download_file/", file_name).to_s
    render :json => {:link => view_file}.to_json
  end

  def access_file
    if File.exists?(Rails.root.join("public", "uploads", "files", params[:name]))
      send_data File.read(Rails.root.join("public", "uploads", "files", params[:name])), :disposition => "attachment"
    else
      render :nothing => true
    end
  end

  private
  def campaign_param
    params.require(:campaign).permit(:name, :uri, :location, :category, :goal, :deadline, :about, :video, :card_description, :card_image, :file, :users_id)
  end

  def set_initial_section
    unless params.include? 'section'
      redirect_to "#{request.original_url}?section=basic"
    end
  end
end
