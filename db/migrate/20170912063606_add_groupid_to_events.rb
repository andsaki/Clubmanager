class AddGroupidToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :group_id, :integer
  end
end
