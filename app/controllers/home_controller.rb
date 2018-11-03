# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @campaigns = Campaign.includes(:campaign_category, :user).where(status: 'online').limit(4).order(created_at: :desc).decorate
  end

  def explore
    @campaigns = Campaign.includes(:campaign_category, :user).where(status: %w[online success fail]).order(created_at: :desc).decorate
  end
end
