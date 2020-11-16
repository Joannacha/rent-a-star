class RemoveReviewsIdToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :review, index: true, foreign_key: true
  end
end
