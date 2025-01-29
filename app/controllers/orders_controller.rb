class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc).limit(5)
  end

  def new
    @order = Order.new
    @pizzas = Pizza.all
    @crusts = Crust.all
    @toppings = Topping.all
    @sides = Side.all
    @recent_orders = Order.order(created_at: :desc).limit(5)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
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
      pizzas_attributes: [:id, :name, :size, :crust_id, :quantity, :_destroy, topping_ids: []],
      sides_attributes: [:id, :name, :price, :quantity, :_destroy]
    )
  end

end