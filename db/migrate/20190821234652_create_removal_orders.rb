class CreateRemovalOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :removal_orders do |t|
      t.decimal :weight
      t.datetime :removal_date_start
      t.datetime :removal_date_end
      t.string :address

      t.timestamps
    end
  end
end
