class AddDestinationToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :destination, :string
  end
end
