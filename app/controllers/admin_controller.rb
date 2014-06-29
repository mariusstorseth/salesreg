class AdminController < ApplicationController
  before_action :require_user

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
    @offices = Office.all
    @office = Office.new

    if params[:office_id]
      @office_now = Office.find(params[:office_id])
    end
  end

  def sales
    @sales = Sale.all.all.order("created_at DESC")
  end

  def pipelines
    
  end
end
