class AddAuthColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_index :users, :email
  end
end
