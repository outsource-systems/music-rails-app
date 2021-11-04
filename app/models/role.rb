class Role < ApplicationRecord
  enum name: {
    admin: "admin",
    customer: "customer",
  }, _prefix: true

  validates :name, presence: true, length: { maximum: 255 }
end
