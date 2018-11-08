require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  context "Campaign" do
    let(:user) { create :user }
    let(:campaign_category) { create :campaign_category }
    let(:draft_campaign) { create :draft_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    let(:pending_campaign) { create :pending_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    let(:online_campaign) { create :online_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    let(:rejected_campaign) { create :rejected_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    let(:success_campaign) { create :success_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    let(:failed_campaign) { create :failed_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
    
    it "list published campaigns [online, success, fail]" do
      draft_campaign
      pending_campaign
      online_campaign
      rejected_campaign
      success_campaign
      failed_campaign
      expect(Campaign.published_campaigns).to eq([failed_campaign, success_campaign, online_campaign])
    end

    it "should publish campaign" do
      expect(draft_campaign.publish).to eq(true)
    end
  end
end