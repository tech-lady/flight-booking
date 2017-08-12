class Flight < ApplicationRecord
  belongs_to :aircraft, optional: true, foreign_key: "aircraft_id"
  belongs_to :airport, optional: true, foreign_key: "airport_id"

  has_many :bookings
end
