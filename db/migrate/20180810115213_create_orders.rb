class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :street
      t.text :street_number
      t.text :city
      t.text :state
      t.text :zip_code
      t.text :country
      t.string :email
      t.integer :pay_type

      t.timestamps
    end
  end
end
