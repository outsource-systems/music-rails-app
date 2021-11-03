class Creater < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :poster_url, length: { maximum: 255 }
end
