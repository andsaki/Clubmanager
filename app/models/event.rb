class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, message: 'Too short!'}
  validates :about, presence: true
end
