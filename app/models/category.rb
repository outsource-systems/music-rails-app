class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }

  has_many :category_item_assignments, dependent: :destroy
  has_many :items, through: :category_item_assignments
  has_many :category_product_assignments, dependent: :destroy
  has_many :products, through: :category_product_assignments
end
