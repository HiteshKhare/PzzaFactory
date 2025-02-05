class ChangePizzaIdInOrderItems < ActiveRecord::Migration[8.0]
  def change
    change_column_null :order_items, :pizza_id, true
    change_column_null :order_items, :side_id, true
  end
end
