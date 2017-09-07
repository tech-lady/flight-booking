class AirportController < ApplicationController
  def index
    @irports = Airports.all
  end

  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)
  end

  def edit
  end

  def show
    @airport = Airport.find(params[:id])
  end

  private
  def airport_params
    params.require(:airport).permit(:name)
  end
end
