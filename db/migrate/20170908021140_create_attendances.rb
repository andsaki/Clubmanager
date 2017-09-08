class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :e_id
      t.string :username

      t.timestamps
    end
  end
end
