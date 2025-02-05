class Pizza < ApplicationRecord
  belongs_to :crust, optional: true
  has_and_belongs_to_many :toppings

  has_many :order_item_pizzas
  
  validates :name, :size, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "category", "size", "price", "crust" "created_at", "updated_at"]
  end

  def formatted_name_price
    "#{name} (#{size}) (₹#{price})"
  end
end
