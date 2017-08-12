class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @user = User.all
  end


  def new
    @user = User.new
    render :index
  end

  def create
    @user = User.create(users_params)
    if @user.save
      sign_in @user
    else
      flash[:alert] = @user.errors.full_messages[0]
    end
    render :show
  end

  def show

  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirm)
  end
end
