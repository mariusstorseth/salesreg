class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :user_id 
      t.integer :amount
      t.string :month

      t.timestamps
    end
  end
end
