class AddIndexToShodan < ActiveRecord::Migration
  def change
    add_index :shodans, :bb_number
  end
end
