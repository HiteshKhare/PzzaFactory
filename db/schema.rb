# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_05_095419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "crusts", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "item_type"
    t.string "item_name"
    t.integer "quantity"
    t.datetime "expiry_date"
    t.bigint "crust_id"
    t.bigint "side_id"
    t.bigint "topping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crust_id"], name: "index_inventories_on_crust_id"
    t.index ["side_id"], name: "index_inventories_on_side_id"
    t.index ["topping_id"], name: "index_inventories_on_topping_id"
  end

  create_table "order_item_pizzas", force: :cascade do |t|
    t.bigint "order_item_id", null: false
    t.bigint "pizza_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "crust_id"
    t.index ["order_item_id"], name: "index_order_item_pizzas_on_order_item_id"
    t.index ["pizza_id"], name: "index_order_item_pizzas_on_pizza_id"
  end

  create_table "order_item_pizzas_toppings", id: false, force: :cascade do |t|
    t.bigint "order_item_pizza_id", null: false
    t.bigint "topping_id", null: false
  end

  create_table "order_item_sides", force: :cascade do |t|
    t.bigint "order_item_id", null: false
    t.bigint "side_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_order_item_sides_on_order_item_id"
    t.index ["side_id"], name: "index_order_item_sides_on_side_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "pizza_id"
    t.bigint "side_id"
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["pizza_id"], name: "index_order_items_on_pizza_id"
    t.index ["side_id"], name: "index_order_items_on_side_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.string "mobile_number"
    t.decimal "total_amount"
    t.decimal "discount"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "side_quantity"
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.decimal "price"
    t.bigint "crust_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["crust_id"], name: "index_pizzas_on_crust_id"
  end

  create_table "pizzas_toppings", id: false, force: :cascade do |t|
    t.bigint "pizza_id", null: false
    t.bigint "topping_id", null: false
    t.index ["pizza_id", "topping_id"], name: "index_pizzas_toppings_on_pizza_id_and_topping_id", unique: true
    t.index ["pizza_id"], name: "index_pizzas_toppings_on_pizza_id"
    t.index ["topping_id"], name: "index_pizzas_toppings_on_topping_id"
  end

  create_table "sides", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "mobile_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "crusts"
  add_foreign_key "inventories", "sides"
  add_foreign_key "inventories", "toppings"
  add_foreign_key "order_item_pizzas", "order_items"
  add_foreign_key "order_item_pizzas", "pizzas"
  add_foreign_key "order_item_sides", "order_items"
  add_foreign_key "order_item_sides", "sides"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "pizzas"
  add_foreign_key "order_items", "sides"
  add_foreign_key "pizzas", "crusts"
  add_foreign_key "pizzas_toppings", "pizzas"
  add_foreign_key "pizzas_toppings", "toppings"
end
