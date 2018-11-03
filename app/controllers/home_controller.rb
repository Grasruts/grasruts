# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @campaigns = Campaign.online_campaigns.decorate
  end

  def explore
    @campaigns = Campaign.published_campaigns.decorate
  end
end
