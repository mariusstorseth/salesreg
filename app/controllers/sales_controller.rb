class SalesController < ApplicationController
  before_action :require_user
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  def index
    @sales = Sale.all
    @user_sales = Sale.search(params[:client], params[:date_from], params[:date_to]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
    @sale = current_user.sales.new
  end

  def show
  end

  def create
    @sale = current_user.sales.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sales_path, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to :back, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      Sale.joins(:clients).column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:user_id, :client_id, :software, :semi, :production, 
                                    :ads, :other, :description, :file, :state)
    end
end
