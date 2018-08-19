class CreateCampaignImage < ActiveRecord::Migration[5.1]
  def self.up
    create_table :campaign_images do |t|
      t.attachment :campaign_image
      t.references :campaigns, foreign_key: true, index:true
      t.timestamps
    end
  end

  def self.down
    remove_attachment :campaign_images, :campaign_image
  end
end
