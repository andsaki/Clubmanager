class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :master_id
      t.string :master_name

      t.timestamps
    end
  end
end
