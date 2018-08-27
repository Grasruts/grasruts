class DropTableCampaignImage < ActiveRecord::Migration[5.1]
  def change
    drop_table :campaign_images
  end
end
