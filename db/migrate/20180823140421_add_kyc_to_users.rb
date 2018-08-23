class AddKycToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :country, :string
    add_column :users, :contact_number, :string
    add_column :users, :pan, :string
    add_column :users, :city, :string
    add_column :users, :about, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end
