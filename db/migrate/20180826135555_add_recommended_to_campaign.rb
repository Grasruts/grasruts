class AddRecommendedToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :recommended, :boolean
  end
end
