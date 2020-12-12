class Admin::OrderProductsController < ApplicationController

  def update
    order_product = OrderProduct.find(params[:id])
    order = Order.find_by(id: order_product.order_id)
    order_products = order.order_products
    making_status = params[:order_product][:making_status].to_i
    order_product.update(making_status: making_status)
    
    if making_status == 2
      order.update(status: 2)
    elsif order_products.all?{|op| op.making_status_before_type_cast == 3 }
      order.update(status: 3)
    end
    redirect_to admin_order_path(order_product.order)
  end

  private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end


end