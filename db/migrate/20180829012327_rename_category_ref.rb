class RenameCategoryRef < ActiveRecord::Migration[5.1]
  def change
    rename_column :campaigns, :campaign_categories_id, :campaign_category_id
  end
end
