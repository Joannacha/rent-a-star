class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, :through :bookings
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
end
