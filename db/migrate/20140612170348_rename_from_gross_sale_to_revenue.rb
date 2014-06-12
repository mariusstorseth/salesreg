class RenameFromGrossSaleToRevenue < ActiveRecord::Migration
  def change
    rename_column :sales, :gross_sale, :revenue
    rename_column :opportunities, :total_gross_sale, :total_revenue
    rename_column :opportunities, :weighted_gross_sale, :weighted_revenue
  end
end
