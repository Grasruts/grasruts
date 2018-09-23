class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :uri, unique: true
      t.text :about
      t.integer :goal
      t.text :faq
      t.string :card_description
      t.string :card_image
      t.integer :mode, default: 0
      t.integer :status, default: 0
      t.integer :deadline
      t.string :location
      t.string :video
      t.string :video_image
      t.boolean :recommended
      t.string :video_id
      t.datetime :published_date
      t.timestamps
    end
    add_index :campaigns, :name
  end
end
