class AddCrustIdToOrderItemPizzas < ActiveRecord::Migration[8.0]
  def change
    add_column :order_item_pizzas, :crust_id, :integer
  end
end
