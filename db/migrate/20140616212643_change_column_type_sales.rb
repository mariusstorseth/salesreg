class ChangeColumnTypeSales < ActiveRecord::Migration
  def change
    change_column :sales, :description, :text
  end
end
