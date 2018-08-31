class AddCategoryRefToCamapign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :category
    add_reference :campaigns, :campaign_categories, foreign_key: true, index: true
  end
end
