require 'spec_helper'

RSpec.describe "HomeDecorator" do
  let(:user) { create :user }
  let(:campaign_category) { create :campaign_category }
  let(:online_campaign) { create :online_campaign, user_id: user.id, campaign_category_id: campaign_category.id}
  let(:reward) { create :reward, campaign_id: online_campaign.id }

  it "should print campaign status" do
    expect(online_campaign.decorate.campaign_status).to eq(2)
  end

end