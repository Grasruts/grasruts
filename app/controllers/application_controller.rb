# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_raven_context

  def is_owner_of_campaign?
    id = params[:controller] == 'campaign' ? params[:id] : params[:campaign_id]
    redirect_back(fallback_location: root_path) unless current_user.campaigns.find_by_uuid!(id)
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
