class OrderItemPizza < ApplicationRecord
  belongs_to :order_item
  belongs_to :pizza
  belongs_to :crust, optional: true

  has_and_belongs_to_many :toppings

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
