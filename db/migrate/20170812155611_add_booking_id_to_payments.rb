class AddBookingIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_reference :payments, :booking, foreign_key: true
  end
end
