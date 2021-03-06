module OfficesHelper

  def office_margin(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.sales.this_month.sum(:margin)
    end
    return sum
  end

  def office_revenue(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.sales.this_month.sum(:revenue)
    end
    return sum
  end

  def office_current_budget(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.budgets.search(Time.now.strftime("%B"), Time.now.strftime("%Y")).sum(:amount)
    end
    return sum
  end

  def office_month_budget(office, month, year)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.budgets.search(month, year).sum(:amount)
    end
    return sum
  end

  def office_pipeline_margin(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.opportunities.this_month.sum(:weighted_margin)
    end
    return sum
  end

  def office_pipeline_revenue(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.opportunities.this_month.sum(:weighted_revenue)
    end
    return sum
  end
end
