class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def redirect_guests
    if not current_user
      redirect_to root_path and return
    end
  end
  helper_method :redirect_guests

end
