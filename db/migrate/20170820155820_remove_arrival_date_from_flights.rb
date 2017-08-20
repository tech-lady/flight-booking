class RemoveArrivalDateFromFlights < ActiveRecord::Migration[5.1]
  def change
    remove_column :flights, :arrival_date, :datetime
  end
end
