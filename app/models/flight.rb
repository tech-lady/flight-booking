class Flight < ApplicationRecord
  belongs_to :aircraft, optional: true
  belongs_to :airport, optional: true, foreign_key: "airport_id"

  belongs_to :origin, class_name: "Airport"
  belongs_to :destination, class_name: "Airport"

  has_many :bookings
  validates :origin, presence: true
  validates :destination, presence: true
  validates :departure_date, presence: true
  validate :unique_origin_and_destination

  def self.open_flights
    current_time = DateTime.tomorrow
    where("departure_date >= ?", current_time).sort_by_departure_date
  end

  def self.search(params)
    where(origin_id: params["origin"],
          destination_id: params["destination"],
          departure_date: params["departure_date"]).
      where("available_seats >= ?", params["number_of_passengers"]).
      order(departure_date: "desc")
  end

  def self.sort_by_departure_date
    order("departure_date")
  end

  def unique_origin_and_destination
    if origin_id == destination_id
      errors.add(:origin_id, "must be different from destination")
      errors.add(:destination_id, "must be different from origin")
    end
  end
end
