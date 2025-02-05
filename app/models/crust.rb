class Crust < ApplicationRecord
	validates :name, presence: true

  has_many :pizzas

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "price", "quantity", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["pizzas"]
  end

  def formatted_crust_price
    "#{name} (₹#{price})"
  end
end