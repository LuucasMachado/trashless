class RemoveUserFromRemovalOrderProblem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :removal_order_problems, :user, foreign_key: true
  end
end
