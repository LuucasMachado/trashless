class GarbageMan < ActiveRecord::Migration[5.2]
  def change
    create_table :garbage_mans do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :withdrawal
      t.references :cooperative, foreign_key: true

      t.timestamps
    end
  end
end
