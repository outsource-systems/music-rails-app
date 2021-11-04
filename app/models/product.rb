class Product < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }
  validates :type, presence: true, length: { maximum: 255 }
  validates :release_date, presence: true

  mount_uploader :poster_url, ImageUploader
end
