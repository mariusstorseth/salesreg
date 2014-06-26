module UsersHelper

  def empl(user)
    empl = user.full_name
    return link_to empl, user_path(user)
  end

  def seller_current_budget(user)
    user.budgets.search(Time.now.strftime("%B"), Time.now.strftime("%Y")).sum(:amount)
  end
end
