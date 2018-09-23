class AddCategoryRefToCamapign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :campaign_category, foreign_key: true, index: true
  end
end
