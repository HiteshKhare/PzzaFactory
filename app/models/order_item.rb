class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :order_item_sides, dependent: :destroy
  has_many :sides, through: :order_item_sides

  has_many :order_item_pizzas, dependent: :destroy
  has_many :pizzas, through: :order_item_pizzas

  accepts_nested_attributes_for :order_item_sides, allow_destroy: true
  accepts_nested_attributes_for :order_item_pizzas, allow_destroy: true
end
