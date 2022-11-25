class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :email
      t.string :mobile
      t.string :address_line_1
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :pan_number

      t.timestamps
    end
  end
end
