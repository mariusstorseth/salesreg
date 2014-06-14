class UserSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully!"
      redirect_to sales_path
    else
      flash[:error] = "Wrong email or password!"
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: "you have been logged out."
  end
end
