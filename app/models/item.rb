class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :time, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :type, presence: true, length: { maximum: 255 }

  mount_uploader :poster_url, ImageUploader
  mount_uploader :url, ImageUploader
end
