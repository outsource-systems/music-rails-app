class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :time, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }
  validates :url, null: false, presence: true, length: { maximum: 255 }
  validates :type, null: false, presence: true, length: { maximum: 255 }
end
