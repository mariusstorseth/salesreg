module ApplicationHelper
  def currentpath(path)
    "active" if current_page?(path)
  end

  def currency(number)
    return number_to_currency(number, unit: "", precision: 0, delimiter: " ")
  end
end
