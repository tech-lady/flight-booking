class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show edit update destroy)
  before_action :check_user_login, only: %i(index new)

  def index
    @bookings = if @current_user.admin
                  Booking.all
                else
                  current_user.bookings
                end
  end

  def new
    if params[:flight_booking][:flight_id].nil?
      flash[:alert] = "Please select a Flight"
      return redirect_to root_path
    end
    @number_of_passengers = params[:flight_booking][:number_of_passengers].to_i
    @flight = Flight.find(params[:flight_booking][:flight_id])
    @booking = current_user.bookings.build(flight: @flight)
    @number_of_passengers.times do
      @booking.passengers << Passenger.new
    end
  end

  def show; end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      flash[:notice] = "Flight booked!"
      redirect_to @booking
    else
      @number_of_passengers = params[:number_of_passengers].to_i
      render :new
    end
  end

  def booking_params
    params.require(:booking).
      permit(:flight_id,
             :booking_reference,
             :passenger_email,
             passengers_attributes: %i(name email phone_number age))
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
