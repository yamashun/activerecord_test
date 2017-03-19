class CreateShodans < ActiveRecord::Migration
  def change
    create_table :shodans do |t|
      t.integer :bb_number
      t.string :first_name
      t.string :last_name
      t.integer :status

      t.timestamps null: false
    end
  end
end
