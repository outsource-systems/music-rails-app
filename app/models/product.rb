class Product < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }
  validates :type, null: false, presence: true, length: { maximum: 255 }
  validates :release_date, presence: true
end
