class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :total_reward
      t.integer :claimed_reward
      t.datetime :shipping_date
      t.boolean :limited
      t.timestamps
    end
  end
end
