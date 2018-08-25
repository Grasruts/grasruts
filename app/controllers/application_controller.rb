class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_owner_of_campaign?
    unless current_user.campaigns.find_by_id(params[:id])
      redirect_back(fallback_location: root_path)
    end
  end
end
