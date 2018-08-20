class AddLocationToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :location, :string
  end
end
