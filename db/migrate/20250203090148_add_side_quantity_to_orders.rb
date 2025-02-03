class AddSideQuantityToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :side_quantity, :integer
  end
end
