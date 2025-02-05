class CreateOrderItemPizzaAndOrderItemSide < ActiveRecord::Migration[8.0]
  def change
    create_table :order_item_pizzas do |t|
      t.references :order_item, foreign_key: true, null: false
      t.references :pizza, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end

    create_table :order_item_sides do |t|
      t.references :order_item, foreign_key: true, null: false
      t.references :side, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
