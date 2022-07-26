class CreatorProductAssignment < ApplicationRecord
  belongs_to :product
  belongs_to :creator
end
