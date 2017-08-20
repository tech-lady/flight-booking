class FlightsController < ApplicationController
  # skip_before_action :authenticate_user, only: :index
  before_action :set_flights, only: %i(show update edit)
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
    @flights = Flight.search(search_params)
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

  # def delete
  # end

  private

  def flight_params
    params.require(:flight).
      permit(:origin_id, :destination_id, :airport_id,
             :available_seats, :departure_date)
  end

  def search_params
    params.permit(:origin, :destination, :number_of_passengers, :departure_date)
  end

  def set_flights
    @flight = Flight.find(params[:id])
  end
end
