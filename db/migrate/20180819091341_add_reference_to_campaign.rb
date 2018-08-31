class AddReferenceToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :rewards, :campaign, foreign_key: true, index: true
    add_reference :campaign_updates, :campaign, foreign_key: true, index: true
  end
end
