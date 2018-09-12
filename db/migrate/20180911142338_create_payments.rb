class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.jsonb :raw, default: {}
      t.integer :amount
      t.string :ref_id
      t.timestamps
    end
    add_reference :payments, :contribution, foreign_key: true, index: true
    add_reference :payments, :user, foreign_key: true, index: true
  end
end
