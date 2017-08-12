class HomeController < ApplicationController
  # skip_before_action :authenticate_user, only: :index

  def index
    @airports = Airport.all
  end
end
