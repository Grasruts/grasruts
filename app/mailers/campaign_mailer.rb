# frozen_string_literal: true

class CampaignMailer < ApplicationMailer
  def review_email(id)
    @campaign = Campaign.find_by id: id
    @campaign_url = "http://www.grasruts.com/#{@campaign.uri}"
    mail(to: 'admin@gmail.com', subject: 'Grasruts: Campaign Approval Request')
  end
end
