class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :arrival_date
      t.datetime :departure_date
      t.integer  :state_id

      t.timestamps
    end
  end
end
