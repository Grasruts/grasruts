class AddDiscardedAtToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :discarded_at, :datetime
    add_index :campaigns, :discarded_at
  end
end
