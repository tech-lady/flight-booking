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
    unless current_user.admin?
      flash[:notice] = "Access denied"
      redirect_to root_path
    end
  end
end
