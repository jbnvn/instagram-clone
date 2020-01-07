class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, dependent: :destroy
  validates :description, presence: true
  validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
