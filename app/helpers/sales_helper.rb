module SalesHelper

  def sale_date(sale)
    return link_to sale.created_at.strftime("%b %d, %Y"), sale_path(sale)
  end

  def show_state(sale)
    html = ""
    if sale.state == "Approved"
      html << "<span class='label label-primary'>"
      html << sale.state
      html << "</span>"
    elsif sale.state == "Declined"
      html << "<span class='label label-danger'>"
      html << sale.state
      html << "</span>"
    else
      html << "<span class='label label-default'>"
      html << "Waiting..."
      html << "</span>"
    end
    return html.html_safe
  end
end
