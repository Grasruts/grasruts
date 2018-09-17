class AddUuid < ActiveRecord::Migration[5.1]
  def change
    add_column :campaign_categories, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :campaign_updates, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :campaigns, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :contributions, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :faqs, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :payments, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :rewards, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
    add_column :users, :uuid, :uuid, default: 'gen_random_uuid()', null: false, unique: true
  end
end
