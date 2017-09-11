class AddPToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :p, :integer
  end
end
