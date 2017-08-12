module ExceptionHandler
  extend ActiveSupport::Concern

  class Unauthenticated < StandardError; end

  included do
    rescue_from ExceptionHandler::Unauthenticated, with: :redirect
  end

  def redirect(e)
    redirect_to new_user_path
  end
end