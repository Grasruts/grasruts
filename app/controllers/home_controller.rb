# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if session[:campaign_id] && current_user
      campaign = Campaign.find_by_uuid session[:campaign_id]
      campaign.user_id = current_user.id
      campaign.save
      session[:campaign_id] = nil
      redirect_to edit_campaign_path(campaign.id)
    end
  end

  def explore; end
end
