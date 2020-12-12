class Admin::OrdersController < ApplicationController
    
  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admin/homes" && path[:action] == "top"
      @orders = Order.where(created_at: Date.today.all_day).page(params[:page]).per(10).reverse_order
    elsif path[:controller] == "admin/customers" && path[:action] == "show" && params.has_key?(:customer_id)
      customer = Customer.find(params[:customer_id])
      @orders = customer.orders.page(params[:page]).per(10).reverse_order
    else 
      @orders = Order.page(params[:page]).per(10).reverse_order
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order)
    @customer = Customer.find_by(id: @order.customer_id)
  end
  
  def update
    order = Order.find(params[:id])
    order_products = order.order_products
    status = params[:order][:status].to_i
    order.update(status: status)
    if status == 1
      order_products.each do |op|
        op.update(making_status: 1)
      end
    end
    redirect_to admin_order_path(order)
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
  
  
end