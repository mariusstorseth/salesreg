class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.string :country
      t.string :currency

      t.timestamps
    end
  end
end
