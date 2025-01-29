class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence: true
  validates :mobile_number, presence: true, uniqueness: true, format: { with: /\A[6-9]\d{9}\z/, message: "must be a valid Indian mobile number" }

  has_many :orders
end
