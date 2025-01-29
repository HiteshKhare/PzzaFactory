class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :mobile_number
      t.decimal :total_amount
      t.decimal :discount
      t.string :order_status

      t.timestamps
    end
  end
end
