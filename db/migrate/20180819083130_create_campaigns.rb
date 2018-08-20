class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :uri, unique: true
      t.text :about
      t.decimal :goal, :precision => 8, :scale => 2
      t.text :faq
      t.string :card_description
      t.string :card_image
      t.string :category
      t.integer :mode, default: 1
      t.integer :status, default: 1
      t.datetime :deadline
      t.timestamps
    end
    add_index :campaigns, :name
  end
end
