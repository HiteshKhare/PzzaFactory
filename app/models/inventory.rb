class Inventory < ApplicationRecord
	belongs_to :crust, optional: true
  belongs_to :side, optional: true
  belongs_to :topping, optional: true

  validates :item_name, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "crust_id", "expiry_date", "id", "item_name", "item_type", "quantity", "side_id", "topping_id", "updated_at"]
  end
end
