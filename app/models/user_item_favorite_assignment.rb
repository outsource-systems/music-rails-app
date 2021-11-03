class UserItemFavoriteAssignment < ApplicationRecord
  belongs_to :item_id
  belongs_to :user_id
end
