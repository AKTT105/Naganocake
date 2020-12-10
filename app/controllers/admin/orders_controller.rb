class Admin::OrdersController < ApplicationController
    
    def index
      path = Rails.application.routes.recognize_path(request.referer)
      if path[:controller] == "admin/homes" && path[:action] == "top"
        @orders = Order.where(created_at: Date.today.all_day).page(params[:page]).reverse_order
      elsif path[:controller] == "admin/customers" && path[:action] == "show"
        customer = Customer.find(params[:customer_id])
        @orders = customer.orders.page(params[:page]).reverse_order
      else 
        @orders = Order.page(params[:page]).reverse_order
      end
    end
    
    def show
      @order = Order.find(params[:id])
      @order_products = OrderProduct.where(order_id: @order)
      @customer = Customer.find_by(id: @order.customer_id)
    end
    
    def update
      order = Order.find(params[:id])
      order_products = OrderProduct.where(order_id: order.id)
      order.update(order_params)
      if order.status == "入金確認"
        order_products.each do |op|
          op.update(making_status: "製作待ち")
        end
      end
      
      redirect_to admin_order_path(order)
    end
    
    private
    def order_params
      params.require(:order).permit(:status)
    end
    
    
end
