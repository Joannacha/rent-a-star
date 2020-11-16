class Booking < ApplicationRecord
  belongs_to :star
  belongs_to :user
  has_many :reviews
end
