class Review < ApplicationRecord
  validates :rating, presence: true
end
