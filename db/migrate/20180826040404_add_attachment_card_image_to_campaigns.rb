class AddAttachmentCardImageToCampaigns < ActiveRecord::Migration[5.1]
  
  def change
    remove_column :campaigns, :card_image
  end

  def self.up
    change_table :campaigns do |t|
      t.attachment :card_image
    end
  end

  def self.down
    remove_attachment :campaigns, :card_image
  end
end
