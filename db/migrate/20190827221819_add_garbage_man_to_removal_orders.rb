class AddGarbageManToRemovalOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :removal_orders, :garbage_man, foreign_key: true
  end
end
