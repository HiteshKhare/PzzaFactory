class CreateJoinTableOrderItemPizzaToppings < ActiveRecord::Migration[8.0]
  def change
    create_join_table :order_item_pizzas, :toppings do |t|
      # t.index [:order_item_pizza_id, :topping_id]
      # t.index [:topping_id, :order_item_pizza_id]
    end
  end
end
