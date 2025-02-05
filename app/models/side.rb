class Side < ApplicationRecord
  has_many :order_item_sides
  
	validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    %w[order your_other_associations]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id name price quantity created_at updated_at]
  end

  def formatted_side_price
    "#{name} (₹#{price})"
  end
end
