class AddCategoryToPizzas < ActiveRecord::Migration[8.0]
  def change
    add_column :pizzas, :category, :string
    add_column :toppings, :category, :string
  end
end
