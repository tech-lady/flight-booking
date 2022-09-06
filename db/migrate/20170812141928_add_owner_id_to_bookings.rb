class AddOwnerIdToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :users, foreign_key: true
  end
end
