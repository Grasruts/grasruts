class CreateContribution < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.integer :amount
      t.integer :gateway 
      t.boolean :anonymous
      t.integer :state
      t.jsonb :raw, default: {}
      t.string :ref_id
      t.timestamps

    end
    add_reference :contributions, :user, foreign_key: true, index: true
    add_reference :contributions, :campaign, foreign_key: true, index: true
    add_reference :contributions, :reward, foreign_key: true, index: true
  end
end
