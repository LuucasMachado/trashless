class DropCollectors < ActiveRecord::Migration[5.2]
  def change
    drop_table :collectors
  end
end
