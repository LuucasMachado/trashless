class AddOwnableToRemovalOrderProblem < ActiveRecord::Migration[5.2]
  def change
    add_reference :removal_order_problems, :ownable, polymorphic: true
  end
end
