class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :address, :string
    add_column :users, :country, :string
    add_column :users, :contact_number, :string
    add_column :users, :pan, :string
    add_column :users, :city, :string
    add_column :users, :about, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :admin, :boolean
  end
end
