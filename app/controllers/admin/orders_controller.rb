class Admin::OrdersController < ApplicationController
    
    def index
      @orders = Order.all
    end
    
    def show
      @order = Order.find(params[:id])
      @order_products = OrderProduct.where(order_id: @order)
      @customer = Customer.find_by(id: @order.customer_id)
      
    end
    
    def update
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admin_order_path(order)
    end
    
    private
    def order_params
      params.require(:order).permit(:status)
    end
    
    
end