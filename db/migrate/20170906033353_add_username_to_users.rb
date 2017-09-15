class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null:false, default: ""
    add_column :users, :age, :integer, default: nil
    add_column :users, :sex, :text, default: ""
    add_column :users, :location, :string, default: ""
    add_column :users, :comment, :text, default: ""
  end
end
