class AddStateToPayment < ActiveRecord::Migration[5.1]
  def change
    remove_column :contributions, :state
    add_column :payments, :state, :integer
  end
end
