class AddStateIdToAirports < ActiveRecord::Migration[5.1]
  def change
    add_reference :airports, :state, foreign_key: true
  end
end
