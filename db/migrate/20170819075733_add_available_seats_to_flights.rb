class AddAvailableSeatsToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :available_seats, :integer
  end
end
