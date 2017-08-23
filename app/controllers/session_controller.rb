class SessionController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      flash[:notice] = "Sign in Successful!"
      sign_in user
      redirect_to root_path
    else
      flash[:alert] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    log_out if signed_in?
    flash[:notice] = "User signed out succesfully"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
