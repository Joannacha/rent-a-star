class Booking < ApplicationRecord
  belongs_to :star
  belongs_to :user
  belongs_to :review
end
