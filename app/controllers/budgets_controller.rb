class BudgetsController < ApplicationController
  before_action :require_user
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to :back, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :back }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to :back, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    def budget_params
      params.require(:budget).permit(:user_id, :year, :month, :amount)
    end
end
