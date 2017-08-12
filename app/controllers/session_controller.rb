class SessionController < ApplicationController
  def create
  end

  def destroy
    log_out if signed_in? 
    flash[:notice] = "User signed out succesfully"
    redirect_to root_path
  end
end
