class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :bb_number
      t.string :car_number
      t.string :maker
      t.string :car_model

      t.timestamps null: false
    end
  end
end
