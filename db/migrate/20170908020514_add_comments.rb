class AddComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :username, :string
    add_column :comments, :user_id, :integer
  end
end
