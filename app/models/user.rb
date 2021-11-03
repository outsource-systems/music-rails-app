class User < ApplicationRecord
  validates :uid, presence: true, length: { maximum: 255 }
end
