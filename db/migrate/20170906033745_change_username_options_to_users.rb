class ChangeUsernameOptionsToUsers < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :users, :name, :string, null: false, default: ""
    end

    def down
      change_column :users, :name, :string, null: true, default: nil
    end
  end
end
