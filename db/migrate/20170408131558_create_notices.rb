class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :status
      t.string :email
      t.string :message

      t.timestamps null: false
    end
  end
end
