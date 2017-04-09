class AddColumnToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :title, :string
  end
end
