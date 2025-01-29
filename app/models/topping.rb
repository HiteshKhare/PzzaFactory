class Topping < ApplicationRecord
	validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_and_belongs_to_many :pizzas
  
  def self.ransackable_associations(auth_object = nil)
    %w[pizzas crusts] # Add the relevant associations
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "id", "id_value", "name", "price", "quantity", "updated_at"]
  end
end
