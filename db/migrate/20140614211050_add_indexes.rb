class AddIndexes < ActiveRecord::Migration
  def change
    add_index :budgets, :user_id
    add_index :budgets, :month
    add_index :opportunities, :user_id
    add_index :opportunities, :client_id
    add_index :sales, :user_id
    add_index :sales, :client_id
    add_index :users, :office_id
  end
end
