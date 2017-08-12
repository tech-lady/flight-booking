module SessionHelper
  def sign_in(user)
    session[:user_id] = user[:id]
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
