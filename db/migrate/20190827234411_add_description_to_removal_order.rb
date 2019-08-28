class AddDescriptionToRemovalOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :removal_orders, :description, :string
  end
end
