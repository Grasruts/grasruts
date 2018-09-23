# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_owner_of_campaign?
    id = params[:controller] == 'campaign' ? params[:id] : params[:campaign_id]
    redirect_back(fallback_location: root_path) unless current_user.campaigns.find_by_uuid(id)
  end
end
