class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :booking_reference
      t.decimal :booking_fee
      t.string :passenger_email

      t.timestamps
    end
  end
end
