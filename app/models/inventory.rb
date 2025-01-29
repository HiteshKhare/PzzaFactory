class Inventory < ApplicationRecord
	belongs_to :crust, optional: true
  belongs_to :side, optional: true
  belongs_to :topping, optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "crust_id", "expiry_date", "id", "item_name", "item_type", "quantity", "side_id", "topping_id", "updated_at"]
  end
end
