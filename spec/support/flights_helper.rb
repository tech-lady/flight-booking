# module ControllerHelpers
  module FlightsHelper
    def valid_search_params
      {
        origin flights.second.origin_id,
        destination: flights.second.destination_id,
        number_of_passengers: 2,
        departure_date: flights.second.departure_date
      }
    end

    def invalid_search_params
      {
        origin: flights.second.origin_id,
        destination: flights.second.destination_id,
        number_of_passengers: 10,
        departure_date: flights.second.departure_date
      }
    end
  end
# end
