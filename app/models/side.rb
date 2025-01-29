class Side < ApplicationRecord
  belongs_to :order, inverse_of: :sides
	validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_associations(auth_object = nil)
    %w[order your_other_associations]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id name price quantity created_at updated_at]
  end
end
