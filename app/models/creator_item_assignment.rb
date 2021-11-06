class CreatorItemAssignment < ApplicationRecord
  belongs_to :item
  belongs_to :creator

  validates :item_id, uniqueness: { scope: :creator_id }, presence: true
end
