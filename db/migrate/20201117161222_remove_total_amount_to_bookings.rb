class RemoveTotalAmountToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :total_amount
  end
end
