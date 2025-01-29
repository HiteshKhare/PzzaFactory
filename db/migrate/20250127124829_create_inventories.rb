class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.string :item_type
      t.string :item_name
      t.integer :quantity
      t.datetime :expiry_date
      t.references :crust, foreign_key: true, null: true
      t.references :side, foreign_key: true, null: true
      t.references :topping, foreign_key: true, null: true

      t.timestamps
    end
  end
end
