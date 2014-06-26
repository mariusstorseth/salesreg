module BudgetsHelper

  def seller_budget(seller, month, year)
    if params[:commit]
      if seller.budgets.search(month, year).sum(:amount) != 0
        return seller.budgets.search(month, year).limit(1).sum(:amount)
      else
        return 0
      end
    else
      if seller.budgets.search(month, year).sum(:amount) != 0
        return seller.budgets.search(Time.now.strftime("%B")).limit(1).sum(:amount)
      else
        return 0
      end
    end
  end



  def seller_budget_id(seller, month, year)
    if params[:commit]
      if seller.budgets.search(month, year).sum(:amount) != 0
        return seller.budgets.search(month, year).limit(1).sum(:id)
      else
        return 0
      end
    else
      if seller.budgets.search(month, year).sum(:amount) != 0
        return seller.budgets.search(Time.now.strftime("%B")).limit(1).sum(:id)
      else
        return 0
      end
    end
  end
end


