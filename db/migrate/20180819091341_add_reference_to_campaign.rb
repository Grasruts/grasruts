class AddReferenceToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :rewards, :campaigns, foreign_key: true, index:true
    add_reference :campaign_updates, :campaigns, foreign_key: true, index:true
  end
end
