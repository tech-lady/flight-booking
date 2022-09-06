class BookingsController < ApplicationController
  before_action :check_user_login, only: %i(index)
  before_action :set_booking, only: %i(show edit update destroy)

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
    @booking = current_user ? current_user.bookings.build(flight: @flight) : Booking.new(flight: @flight)
    @number_of_passengers.times do
      @booking.passengers << Passenger.new
    end
  end

  def show; end

  def create
    @booking = current_user ? current_user.bookings.build(booking_params) : Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Flight booked!"
      email = current_user ? current_user.email : @booking.passenger_email
      current_user ? session.delete(:anonymous_email) : session[:anonymous_email] = email
      UserMailer.confirm_email(email).deliver
      redirect_to @booking
    else
      @number_of_passengers = params[:number_of_passengers].to_i
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).
      permit(:flight_id,
             :passenger_email,
             passengers_attributes: %i(name email phone_number age))
  end

  def set_booking
    @booking = if current_user && current_user.admin
                Booking.find(params[:id])
               else
                 current_user ?
                  current_user.bookings.find(params[:id]) :
                  Booking.where(id: params[:id]).where(passenger_email: session[:anonymous_email])
               end
  end
end
