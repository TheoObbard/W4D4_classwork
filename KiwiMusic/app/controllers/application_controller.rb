class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user
  end

  def logged_in?
    return true if current_user
    return false
  end

end
