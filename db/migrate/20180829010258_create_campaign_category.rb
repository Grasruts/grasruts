class CreateCampaignCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
