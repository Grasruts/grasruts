class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_owner_of_campaign?
    id = params[:controller] == 'campaign' ? params[:id] : params[:campaign_id]
    unless current_user.campaigns.find_by(id: id)
      redirect_back(fallback_location: root_path)
    end
  end
end
