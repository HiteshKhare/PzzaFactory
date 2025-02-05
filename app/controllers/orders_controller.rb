class OrdersController < ApplicationController
  def show
    @order = Order.includes(order_items: [:pizza, :crust, toppings: []]).find(params[:id])
  end

  def index
    @orders = Order.includes(order_items: { order_item_pizzas: [:toppings], order_item_sides: [] }).all
  end


  def new
    @order = Order.new
    @pizzas = Pizza.all
    @crusts = Crust.all
    @sides = Side.all
    @toppings = Topping.all
    @recent_orders = Order.order(created_at: :desc).limit(5)
  end

  def create
    @pizzas = Pizza.all
    @crusts = Crust.all
    @sides = Side.all
    @toppings = Topping.all
    @order = Order.new(order_params)
    @order.order_status = "Pending"
    puts @order
    puts order_params
    puts params
    if @order.save
      save_order_items(@order)
      redirect_to orders_path, notice: "Order placed successfully"
    else
      render :new, alert: "Failed to place order"
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_name, :mobile_number, :total_amount, :discount, :order_status,
      order_items_attributes: [
        :id, :_destroy,
        { order_item_pizzas_attributes: [:id, :pizza_id, :crust_id, :quantity, :price, :_destroy, topping_ids: []] },
        { order_item_sides_attributes: [:id, :side_id, :quantity, :price, :_destroy] }
      ]
    )
  end

  def save_order_items(order)
    return unless params[:order][:order_items]
    order_item = order.order_items.create!
    if params[:order][:order_items][:order_item_pizzas]
      params[:order][:order_items][:order_item_pizzas].each do |_p_key, pizza_data|
        next if pizza_data[:pizza_id].blank?
        toppings_price = 0
        topping_ids = pizza_data[:topping_ids].reject(&:blank?).map(&:to_i)
        crust_price = Crust.find_by(id: pizza_data[:crust_id])&.price || 0
        toppings_price = Topping.where(id: topping_ids).sum(:price)
        order_item_pizza = order_item.order_item_pizzas.create!(
          pizza_id: pizza_data[:pizza_id],
          crust_id: pizza_data[:crust_id],
          quantity: pizza_data[:quantity].to_i
        )
        order_item_pizza.toppings << Topping.where(id: topping_ids)
      end
    end

    if params[:order][:order_items][:order_item_sides]
      params[:order][:order_items][:order_item_sides].each do |_s_key, side_data|
        side = Side.find_by(id: side_data[:side_id])

        order_item.order_item_sides.create!(
          side_id: side_data[:side_id],
          quantity: side_data[:quantity].to_i
        )
      end
    end
  end


end