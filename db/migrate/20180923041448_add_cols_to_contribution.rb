class AddColsToContribution < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :state, :integer
    add_column :contributions, :raw, :jsonb, default: {}
    add_column :contributions, :ref_id, :string
  end
end
