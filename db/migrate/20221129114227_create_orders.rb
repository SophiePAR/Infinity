class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :review
      t.integer :rating
      t.date :date
      t.string :progress
      t.references :user, null: false, foreign_key: true
      t.references :tombstone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
