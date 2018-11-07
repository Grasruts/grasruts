# frozen_string_literal: true

class CampaignMailer < ApplicationMailer
  def review_email(id)
    @campaign = Campaign.find_by_uuid id
    @campaign_url = "https://www.grasruts.com/#{@campaign.uri}"
    mail(to: 'contact@grasruts.com', subject: 'Grasruts: Campaign Approval Request')
  end
end
