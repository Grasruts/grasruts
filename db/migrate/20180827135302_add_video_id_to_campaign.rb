class AddVideoIdToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :video_id, :string
  end
end
