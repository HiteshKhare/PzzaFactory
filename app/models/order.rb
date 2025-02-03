class Order < ApplicationRecord
	validates :customer_name, presence: true
  validates :mobile_number, presence: true, format: { with: /\A[6-9]\d{9}\z/, message: "must be a valid Indian mobile number" }
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  has_many :order_items, dependent: :destroy
  has_many :pizzas, through: :order_items
  has_many :sides, through: :order_items

  accepts_nested_attributes_for :pizzas, allow_destroy: true
  accepts_nested_attributes_for :sides, allow_destroy: true
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at customer_name discount id id_value mobile_number order_status total_amount updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[side customer products]
  end

  def total_price
    if order_items.present?
      order_items.pizzas.sum do |pizza|
        pizza.price + pizza.toppings.sum(&:price) + pizza.crust.price
      end + sides.sum(&:price)
    end
  end
end
