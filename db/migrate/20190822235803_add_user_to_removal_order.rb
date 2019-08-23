class AddUserToRemovalOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :removal_orders, :user, foreign_key: true
  end
end
