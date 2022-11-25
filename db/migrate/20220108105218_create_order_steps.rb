class CreateOrderSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :order_steps do |t|
      t.references :order, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
