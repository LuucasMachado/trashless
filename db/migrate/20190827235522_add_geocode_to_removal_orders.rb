class AddGeocodeToRemovalOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :removal_orders, :latitude, :decimal
    add_column :removal_orders, :longitude, :decimal
  end
end
