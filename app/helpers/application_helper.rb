module ApplicationHelper
  def currentpath(path)
    "active" if current_page?(path)
  end
end
