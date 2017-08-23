class FlightsController < ApplicationController
  before_action :set_flight, only: %i(show update edit)
  before_action :authenticate_admin, only: %i(new create)

  def index
    @flights = Flight.open_flights
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      flash[:notice] = "Flight created successfully"
      redirect_to flights_path
    else
      flash[:alert] = "Error occurred"
      render :new
    end
  end

  def search
    @flights = Flight.open_flights.search(search_params)
    @number_of_passengers = search_params[:number_of_passengers]
  end

  def edit; end

  def update
    if @flight.update_attributes(flight_params)
      flash[:notice] = "Flight updated successfully"
      redirect_to flights_path
    else
      flash[:alert] = "Error occurred"
      render :edit
    end
  end

  private

  def flight_params
    params.require(:flight).
      permit(:origin_id, :destination_id, :airport_id,
             :available_seats, :departure_date, :aircraft_id)
  end

  def search_params
    params.permit(:origin, :destination, :number_of_passengers, :departure_date)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
