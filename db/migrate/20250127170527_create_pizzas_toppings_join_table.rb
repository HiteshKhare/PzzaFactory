class CreatePizzasToppingsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_table :pizzas_toppings, id: false do |t|
      t.references :pizza, null: false, foreign_key: true
      t.references :topping, null: false, foreign_key: true
    end

    add_index :pizzas_toppings, [:pizza_id, :topping_id], unique: true
  end
end
