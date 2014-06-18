class AdminController < ApplicationController

  def index
    @users = User.all
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
