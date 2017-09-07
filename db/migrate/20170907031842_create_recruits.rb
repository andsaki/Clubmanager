class CreateRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :recruits do |t|
      #タイトル
      t.string :title
      #内容
      t.string :body
      #投稿者
      t.string :name
      #管理者フラグ
      t.boolean :administrator, null:false, default:false

      t.timestamps
    end
  end
end
