class OrdersController < ApplicationController
  def show
    @order = Order.includes(order_items: [:pizza, :crust, toppings: []]).find(params[:id])
  end

  def index
    @orders = Order.includes(order_items: [:pizza, :crust, toppings: []]).limit(5)
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
    if @order.save
      puts @order
      redirect_to orders_path, notice: "Order placed successfully"
    else
      render :new, alert: "Failed to place order"
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_name,
      :mobile_number,
      :total_amount,
      :discount,
      :order_status,
      order_items_attributes: [
        { pizzas_attributes: [:id, :pizza_id, :crust_id, :quantity, { topping_ids: [] }] },
        { sides_attributes: [:id, :side_id, :side_quantity] }
      ]
    )
  end

end