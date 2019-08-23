class AddStatusToRemovalOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :removal_orders, :status, :integer, default: "0"
  end
end
