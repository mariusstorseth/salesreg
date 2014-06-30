class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @offices = Office.all

  private
  def logged_in?
    current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def require_user
    if current_user
      true
    else
      flash[:warning] = "You must be signed in to access this page."
      redirect_to login_path
    end
  end

  def require_guest
    if current_user
      flash[:info] = "You are already signed in."
      redirect_to root_path
    else
      true
    end
  end
end
