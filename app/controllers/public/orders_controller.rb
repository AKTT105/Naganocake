class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer)
    #binding.pry
  end

  def show
    @order = Order.where(customer_id: current_customer)
    @order_products = OrderProduct.where(order_id: @order)
  end

  def new
    @order = Order.new
    @customer = current_customer
    #@customer_address = Delivery.where(customer_id: current_customer.id)
  end

  def confirm
    binding.pry
    @order = Order.where(customer_id: current_customer)
    @order_products = OrderProduct.where(order_id: order_params)
    @product =  Product.where(id: @order_products)
    @current_customer_address = current_customer.address
    @payment_type = current_customer.payment_type
    #binding.pry
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to confirm_orders_path
    else
      @orders = Order.all
      render 'index'
    end
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:total_payment,:payment_type,:status)
  end

end