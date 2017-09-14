class Group < ApplicationRecord
  validates :name, presence: true

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Group.where(['name LIKE ?', "%#{search}%"])
    else
      Group.all #全て表示。
    end
  end

end
