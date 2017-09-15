class Group < ApplicationRecord
  validates :name, presence: true

  def self.search(search)
    if search.present?
      Group.where(['name LIKE ?', "%#{search}%"])
    else
      Group.all
    end
  end

end
