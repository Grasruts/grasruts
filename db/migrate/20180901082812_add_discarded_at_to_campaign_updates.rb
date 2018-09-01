class AddDiscardedAtToCampaignUpdates < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_updates, :discarded_at, :datetime
    add_index :campaign_updates, :discarded_at
  end
end
