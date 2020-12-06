class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer)
    #binding.pry
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
    @customer = Customer.find_by(id: @order.customer_id)
  end

  def new
    @customer = Customer.find_by(id: @order.customer_id)
    @customer_address = Customer.find_by(id: @order.customer_id)
  end

  def confirm
  end

  def create
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:total_payment,:payment_type,:status)
  end

end