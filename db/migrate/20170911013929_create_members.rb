class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :group_id
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
