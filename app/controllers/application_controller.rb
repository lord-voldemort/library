class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def logged_in?
    true if current_user
  end

  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def is_admin?
    !logged_in? || !current_user.admin?
  end

  def creator?
  end

  def admin_authorize
    redirect_to root_path, notice: "Need admin privileges" if is_admin?
  end

  def creator_authorize
    redirect_to login_path, alert: "Not authorized, please login" if current_user.nil?
  end

end
