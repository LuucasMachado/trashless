class AddStatusToGarbageMen < ActiveRecord::Migration[5.2]
  def change
    add_column :garbage_men, :status, :decimal
  end
end
