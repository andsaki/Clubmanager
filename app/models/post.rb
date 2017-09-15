class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # @post.comments とかけるようになる
  validates :title, presence: true, length: { minimum: 3, message: 'タイトルが短すぎます (3文字以上)'}
  validates :body, presence: true

  def self.search(search)
    if search.present?
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end

end
