class AddLatAndLngToRemovalOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :removal_orders, :lat, :decimal
    add_column :removal_orders, :lng, :decimal
  end
end
