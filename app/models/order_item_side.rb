class OrderItemSide < ApplicationRecord
  belongs_to :order_item
  belongs_to :side

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
