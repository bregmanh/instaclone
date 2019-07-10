class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, attached: true, content_type: %w(image/jpg image/jpeg image/png)
end
