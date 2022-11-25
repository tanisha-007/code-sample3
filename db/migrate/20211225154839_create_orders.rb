class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer
      t.integer :amount
      t.text :details
      t.string :status
      t.datetime :order_date

      t.timestamps
    end
  end
end
