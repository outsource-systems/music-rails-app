class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :record_type, presence: true, length: { maximum: 255 }
  validates :release_date, presence: true
  validates :spotify_id, length: { maximum: 255 }

  mount_uploader :poster_url, ImageUploader

  has_many :category_product_assignments, dependent: :destroy
  has_many :categories, through: :category_product_assignments
  has_many :items, dependent: :destroy

  has_many :creator_product_assignments, dependent: :destroy
  has_many :creators, through: :creator_product_assignments
  has_many :artists, -> { where(type: "Artist") }, through: :creator_product_assignments, source: :creator
end
