class AddBookingReferenceToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :booking, index: true
  end
end
