class ApplicationController < ActionController::Base
  extend ExceptionHandler
  include SessionHelper

  before_action :authenticate_user

  protect_from_forgery with: :exception

  attr_reader :current_user

  private

  def authenticate_user
    @current_user = User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def authenticate_admin
    unless current_user && current_user.admin?
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end

  def check_user_login
    unless signed_in?
      flash[:alert] = "Sign in to continue"
      redirect_to new_session_path
    end
  end
end
