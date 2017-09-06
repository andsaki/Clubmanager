class ChangeUsernameOptionsToUsers < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :users, :username, :string, default: ""
      change_column :users, :age, :integer, default: ""
      change_column :users, :location, :string, default: ""
      change_column :users, :comment, :text, default: ""
    end

    def down
      change_column :users, :username, :string, null: true, default: nil
      change_column :users, :age, :integer, default: nil
      change_column :users, :location, :string, default: nil
      change_column :users, :comment, :text, default: nil
    end
  end
end
