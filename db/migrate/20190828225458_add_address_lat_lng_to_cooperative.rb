class AddAddressLatLngToCooperative < ActiveRecord::Migration[5.2]
  def change
    add_column :cooperatives, :address, :string
    add_column :cooperatives, :lat, :decimal
    add_column :cooperatives, :lng, :decimal
  end
end
