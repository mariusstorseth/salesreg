module BudgetsHelper

  def seller_budget(seller, month)
    if seller.budgets.search(month).sum(:amount) != 0
      return seller.budgets.search(month).sum(:amount)
    else
      return link_to 'Add', new_budget_path
    end
  end
end


