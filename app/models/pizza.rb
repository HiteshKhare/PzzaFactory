class Pizza < ApplicationRecord
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true

  belongs_to :crust, optional: true
  has_and_belongs_to_many :toppings
  belongs_to :order, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "category", "size", "price", "crust" "created_at", "updated_at"]
  end
end
