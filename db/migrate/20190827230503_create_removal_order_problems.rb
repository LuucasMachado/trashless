class CreateRemovalOrderProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :removal_order_problems do |t|
      t.references :user, foreign_key: true
      t.references :removal_order, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
