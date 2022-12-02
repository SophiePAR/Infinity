class AddUserTombstoneToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user_tombstone, null: false, foreign_key: true
  end
end
