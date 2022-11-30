class RemoveProgressFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :progress, :string
  end
end
