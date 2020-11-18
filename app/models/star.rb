class Star < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }

  def average_rating
    return 0 if reviews.blank?

    ratings = reviews.map { |review| review.rating }
    ratings.sum / ratings.count
  end
end
