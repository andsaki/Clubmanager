class AddBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :month, :integer, default: ""
    add_column :users, :day, :integer, default: ""
  end
end
