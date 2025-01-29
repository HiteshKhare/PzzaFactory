class CreatePizzas < ActiveRecord::Migration[8.0]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :size
      t.decimal :price
      t.references :crust, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
