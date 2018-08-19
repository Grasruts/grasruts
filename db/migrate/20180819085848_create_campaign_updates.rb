class CreateCampaignUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_updates do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
