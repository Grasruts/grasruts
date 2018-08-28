class AddPublishedDateToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :published_date, :datetime
  end
end
