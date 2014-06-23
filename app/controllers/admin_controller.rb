class AdminController < ApplicationController
  before_action :require_user

  def index
  end

  def users
    @users = User.all
    @user = User.new
    @offices = Office.all

    if params[:user_id]
      @user_now = User.find(params[:user_id])
    end
  end

  def budgets
    @budgets = Budget.all
    @budget = Budget.new
    @users = User.all.order("office_id ASC")
    @offices = Office.all
  end

  def offices
    
  end

  def sales
    @sales = Sale.all
  end

  def pipelines
    
  end
end
