class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :logged_in?,
                :require_login,
                :require_logout,
                :require_current_user,
                :user_moniker

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def user_moniker(user)
    User.moniker(user)
  end

  def login(user)
    session[:session_token] = user.reset_token!
  end

  def logout
    current_user && current_user.reset_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def require_logout
    redirect_to root_url if logged_in?
  end

  def require_current_user(user)
    if logged_in? && current_user != user
      redirect_to root_url
    elsif !logged_in?
      redirect_to new_session_url
    end
  end

  def logged_in?
    !!current_user
  end

end
