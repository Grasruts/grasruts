class ChangePriceInRewards < ActiveRecord::Migration[5.1]
  def change
    remove_column :rewards, :price
    add_column :rewards, :price, :integer
  end
end
