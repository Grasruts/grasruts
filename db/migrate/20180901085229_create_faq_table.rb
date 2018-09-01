class CreateFaqTable < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.string :name
      t.text :description
    end
    add_reference :faqs, :campaign, foreign_key: true, index: true
  end
end
