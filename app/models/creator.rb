class Creator < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :spotify_id, length: { maximum: 255 }

  mount_uploader :poster_url, ImageUploader

  has_many :creator_item_assignments, dependent: :destroy
  has_many :items, through: :creator_item_assignments
  has_many :creator_product_assignments, dependent: :destroy
  has_many :products, through: :creator_product_assignments
end
