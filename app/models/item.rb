class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :time, presence: true, length: { maximum: 255 }
  validates :url, presence: true
  validates :spotify_id, length: { maximum: 255 }

  has_many :category_item_assignments, dependent: :destroy
  has_many :categories, through: :category_item_assignments

  has_many :creator_item_assignments, dependent: :destroy
  has_many :creators, through: :creator_item_assignments

  mount_uploader :poster_url, ImageUploader
  mount_uploader :url, ImageUploader
end
