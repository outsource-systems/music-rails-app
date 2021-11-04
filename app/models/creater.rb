class Creater < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }

  mount_uploader :poster_url, ImageUploader
end
