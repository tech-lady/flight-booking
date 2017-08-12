class ApplicationController < ActionController::Base
  include ExceptionHandler
  include SessionHelper

  before_action :authenticate_user

  protect_from_forgery with: :exception

  attr_reader :current

  private

  def authenticate_user
    raise(ExceptionHandler::Unauthenticated, 'Not Authenticated') if session[:user_id].nil?
    @current_user = User.find(session[:user_id])
  end
end
