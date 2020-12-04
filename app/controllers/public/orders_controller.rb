class Public::OrdersController < ApplicationController
  
  def index
    @orders = Order.page(params[:page]).reverse_order
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
    @customer = Customer.find_by(id: @order.customer_id)
  end
  
  def new
  end
  
  def confirm
  end
  
  def create
  end
  
  def done
  end
  
end