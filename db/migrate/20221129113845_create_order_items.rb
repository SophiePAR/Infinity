class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :details
      t.references :prestation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
