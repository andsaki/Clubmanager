class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  #後で変更する
  validates :username, presence: true, length: { in: 1..15 }
  #validates :comment, length: { in: 0..100 }
  validates :age, :numericality => {:only_integer => true, :allow_nil => true}
  #validates :age, numericality: true
end
