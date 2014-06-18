module SalesHelper

  def sale_date(sale)
    return link_to sale.created_at.strftime("%b %d, %Y"), sale_path(sale)
  end
end
