# Seed admin user and default user
if Rails.env.development?
  User.create!(name: "Hitesh", email: "user@example.com", password: "password", mobile_number: "9876543210", password_confirmation: 'password') if User.count == 0
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count.zero?
end

# Seed pizzas
pizza_data = [
  { name: "Deluxe Veggie", category: "Vegetarian", size: "Regular", price: 150 },
  { name: "Deluxe Veggie", category: "Vegetarian", size: "Medium", price: 200 },
  { name: "Deluxe Veggie", category: "Vegetarian", size: "Large", price: 325 },
  { name: "Cheese and corn", category: "Vegetarian", size: "Regular", price: 175 },
  { name: "Cheese and corn", category: "Vegetarian", size: "Medium", price: 375 },
  { name: "Cheese and corn", category: "Vegetarian", size: "Large", price: 475 },
  { name: "Paneer Tikka", category: "Vegetarian", size: "Regular", price: 160 },
  { name: "Paneer Tikka", category: "Vegetarian", size: "Medium", price: 290 },
  { name: "Paneer Tikka", category: "Vegetarian", size: "Large", price: 340 },
  { name: "Non-Veg Supreme", category: "Non-Vegetarian", size: "Regular", price: 190 },
  { name: "Non-Veg Supreme", category: "Non-Vegetarian", size: "Medium", price: 325 },
  { name: "Non-Veg Supreme", category: "Non-Vegetarian", size: "Large", price: 425 },
  { name: "Chicken Tikka", category: "Non-Vegetarian", size: "Regular", price: 210 },
  { name: "Chicken Tikka", category: "Non-Vegetarian", size: "Medium", price: 370 },
  { name: "Chicken Tikka", category: "Non-Vegetarian", size: "Large", price: 500 },
  { name: "Pepper Barbecue Chicken", category: "Non-Vegetarian", size: "Regular", price: 220 },
  { name: "Pepper Barbecue Chicken", category: "Non-Vegetarian", size: "Medium", price: 380 },
  { name: "Pepper Barbecue Chicken", category: "Non-Vegetarian", size: "Large", price: 525 }
]

pizza_data.each do |pizza|
  Pizza.find_or_create_by!(pizza)
end

# Seed toppings
topping_data = [
  { name: "Black olive", category: "Vegetarian", price: 20 },
  { name: "Capsicum", category: "Vegetarian", price: 25 },
  { name: "Paneer", category: "Vegetarian", price: 35 },
  { name: "Mushroom", category: "Vegetarian", price: 30 },
  { name: "Fresh tomato", category: "Vegetarian", price: 10 },
  { name: "Chicken tikka", category: "Non-Vegetarian", price: 35 },
  { name: "Barbeque chicken", category: "Non-Vegetarian", price: 45 },
  { name: "Grilled chicken", category: "Non-Vegetarian", price: 40 },
  { name: "Extra cheese", category: "Vegetarian", price: 35 }
]

topping_data.each do |topping|
  Topping.find_or_create_by!(topping)
end

# Seed sides
side_data = [
  { name: "Cold Drink", price: 55,  },
  { name: "Mousse cake", price: 90 }
]

side_data.each do |side|
  Side.find_or_create_by!(side)
end

# Seed crusts
crust_data = [
  { name: "Fresh pan pizza", price: 0 },
  { name: "New hand tossed", price: 50 },
  { name: "Wheat thin crust", price: 20 },
  { name: "Cheese Burst", price: 80 }
]

crust_data.each do |crust|
  Crust.find_or_create_by!(crust)
end

# Seed inventory
inventory_data = [
  # Crusts
  { item_type: "Crust", item_name: "Fresh Pan Pizza", quantity: 100 },
  { item_type: "Crust", item_name: "New Hand Tossed", quantity: 150 },
  { item_type: "Crust", item_name: "Wheat Thin Crust", quantity: 120 },
  { item_type: "Crust", item_name: "Cheese Burst", quantity: 80 },

  # Sides
  { item_type: "Side", item_name: "Cold Drink", quantity: 50 },
  { item_type: "Side", item_name: "Mousse Cake", quantity: 30 },

  # Toppings
  { item_type: "Topping", item_name: "Black Olive", quantity: 100 },
  { item_type: "Topping", item_name: "Capsicum", quantity: 100 },
  { item_type: "Topping", item_name: "Paneer", quantity: 100 },
  { item_type: "Topping", item_name: "Mushroom", quantity: 100 },
  { item_type: "Topping", item_name: "Fresh Tomato", quantity: 100 },
  { item_type: "Topping", item_name: "Chicken Tikka", quantity: 50 },
  { item_type: "Topping", item_name: "Barbeque Chicken", quantity: 50 },
  { item_type: "Topping", item_name: "Grilled Chicken", quantity: 50 },
  { item_type: "Topping", item_name: "Extra Cheese", quantity: 80 }
]

inventory_data.each do |inventory|
  Inventory.find_or_create_by!(item_type: inventory[:item_type], item_name: inventory[:item_name]) do |inv|
    inv.quantity = inventory[:quantity]
  end
end

puts "Seeded inventory data successfully!"


# Seed orders
order_data = [
  { customer_name: "John Doe", mobile_number: "9876543210", total_amount: 200, order_status: "completed", discount: 0},
  { customer_name: "Jane Smith", mobile_number: "8765432109", total_amount: 150, order_status: "cancelled", discount: 0}
]

order_data.each do |order|
  Order.find_or_create_by!(order)
end

puts "Seeding complete!"