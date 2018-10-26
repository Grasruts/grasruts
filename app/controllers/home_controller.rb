# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if session[:campaign_id] && current_user
      campaign = Campaign.find_by_uuid! session[:campaign_id]
      campaign.user_id = current_user.id
      campaign.save
      session[:campaign_id] = nil
      redirect_to edit_campaign_path(campaign.id)
    end
    @campaigns = Campaign.includes(:campaign_category, :user).where(status: 'online').limit(4).order(created_at: :desc).decorate
  end

  def explore
    @campaigns = Campaign.includes(:campaign_category, :user).where(status: %w[online success fail]).order(created_at: :desc).decorate
  end
end
