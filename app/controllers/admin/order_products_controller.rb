class Admin::OrderProductsController < ApplicationController

  def update
    order_product = OrderProduct.find(params[:id])
    order = Order.find_by(id: order_product.order_id)
    order_products = order.order_products
    order_product.update(order_product_params)
    # binding.pry
    if order_product.making_status == "製作中"
      order.update(status: "製作中")
    elsif order_products.all?{|op| op.making_status == "製作完了"}
      order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(order_product.order)
  end

  private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end


end