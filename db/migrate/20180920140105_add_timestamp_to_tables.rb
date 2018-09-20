class AddTimestampToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_categories, :created_at, :datetime,  default: DateTime.now, null: false
    add_column :campaign_categories, :updated_at, :datetime,  default: DateTime.now, null: false

    add_column :faqs, :created_at, :datetime,  default: DateTime.now, null: false
    add_column :faqs, :updated_at, :datetime,  default: DateTime.now, null: false
  end
end
