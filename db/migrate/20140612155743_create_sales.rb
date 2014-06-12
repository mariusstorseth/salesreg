class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.integer :user_id
      t.integer :software
      t.integer :software_margin
      t.integer :software_rate
      t.integer :semi
      t.integer :semi_margin
      t.integer :semi_rate
      t.integer :production
      t.integer :production_margin
      t.integer :production_rate
      t.integer :ads
      t.integer :ads_margin
      t.integer :ads_rate
      t.integer :other
      t.integer :other_margin
      t.integer :other_rate
      t.integer :margin
      t.integer :gross_sale
      t.string :description

      t.timestamps
    end
  end
end
