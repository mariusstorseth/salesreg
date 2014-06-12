class RemoveCountryFromOffices < ActiveRecord::Migration
  def change
    remove_column :offices, :country
  end
end
