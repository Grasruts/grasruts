class CampaignController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  def new
    @campaign = Campaign.new
  end

  def show
  end
end
