class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :about
      t.string :year
      t.string :month
      t.string :date
      t.string :username

      t.timestamps
    end
  end
end
