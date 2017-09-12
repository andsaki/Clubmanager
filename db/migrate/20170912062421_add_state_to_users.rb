class AddStateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :state_group_id, :integer, default: -1
  end
end
