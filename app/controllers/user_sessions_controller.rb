class UserSessionsController < ApplicationController

  def new
    if cookies[:auth_token]
      flash[:info] = "You are already signed in."
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:success] = "Logged in successfully!"
      redirect_to sales_path
    else
      flash[:warning] = "Wrong email or password!"
      render action: 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:info] = "you have been logged out."
    redirect_to root_path
  end
end
