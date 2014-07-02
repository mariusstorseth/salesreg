module ApplicationHelper
  def currentpath(path)
    "active" if current_page?(path)
  end

  def currency(number)
    return number_to_currency(number, unit: "", precision: 0, delimiter: " ")
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil)
  end
end
