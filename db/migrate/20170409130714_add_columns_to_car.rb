class AddColumnsToCar < ActiveRecord::Migration
  def change
    add_column :cars, :sell_user_id, :integer
    add_column :cars, :shop_user_id, :integer
    add_column :cars, :buy_user_id,  :integer
  end
end
