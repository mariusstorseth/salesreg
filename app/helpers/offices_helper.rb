module OfficesHelper

  def office_margin(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.sales.sum(:margin)
    end
    return sum
  end

  def office_revenue(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.sales.sum(:revenue)
    end
    return sum
  end

  def office_budget(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.budgets.sum(:amount)
    end
    return sum
  end

  def office_pipeline_margin(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.opportunities.sum(:weighted_margin)
    end
    return sum
  end

  def office_pipeline_revenue(office)
    users = User.all.where(:office => office)
    sum = 0
    users.each do |user|
      sum += user.opportunities.sum(:weighted_revenue)
    end
    return sum
  end
end
