class AddFileColumnToSales < ActiveRecord::Migration
  def self.up
    add_attachment :sales, :file
  end

  def self.down
    remove_attachment :sales, :file
  end
end
