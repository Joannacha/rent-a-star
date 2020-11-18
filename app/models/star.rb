class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
end
