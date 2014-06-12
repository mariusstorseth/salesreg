class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :invoice_address_street
      t.integer :invoice_address_zip
      t.string :invoice_address_city
      t.string :invoice_address_country
      t.string :contact_name
      t.string :contact_email
      t.integer :contact_phone

      t.timestamps
    end
  end
end
