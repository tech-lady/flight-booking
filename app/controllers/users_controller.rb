class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i(new create)

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if users_params[:password] != users_params[:confirm_password]
      flash[:alert] = "Password does not match"
      return render :new
    end
    if @user.save
      flash[:notice] = "Signed up successfully"
      sign_in @user
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      render :new
    end
  end

  def show; end

  private

  def users_params
    params.require(:user).
      permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
