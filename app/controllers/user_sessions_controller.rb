class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Signed in successfully!"
      redirect_to sales_path
    else
      flash[:error] = "Wrong email or password!"
      render action: 'new'
    end
  end
end
