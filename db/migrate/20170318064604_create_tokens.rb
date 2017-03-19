class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :car, index: true, foreign_key: true
      t.string :token
      t.datetime :expiration_date
      t.integer :status

      t.timestamps null: false
    end
  end
end
