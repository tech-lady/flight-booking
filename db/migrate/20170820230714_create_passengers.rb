class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :age
      t.references :booking

      t.timestamps
    end

    add_foreign_key :passengers, :bookings
  end
end
