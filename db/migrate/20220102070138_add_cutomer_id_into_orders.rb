class AddCutomerIdIntoOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cutomer_id, :integer
  end
end
