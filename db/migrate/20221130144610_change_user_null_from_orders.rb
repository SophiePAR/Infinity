class ChangeUserNullFromOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :user_id, true
  end
end
