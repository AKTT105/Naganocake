class Public::OrdersController < ApplicationController

  def index
    @order = Order.where(customer_id: current_customer)
    @orders = @order.all
  end

  def show
    @order = Order.where(customer_id: current_customer)
    @orders = @order.all
    @order_product = OrderProduct.where(order_id: @order)
    @cart_products = current_customer.cart_products
    #@product = Product.where[:order_product][:product_id]
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order_product = OrderProduct.new
    if params[:order][:address_type] == "A"
      #自分の登録済みの住所(ユーザーモデルの住所)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_type] == "B"
      #Deliveriesから選択された住所
      selected_address = current_customer.deliveries.find(params[:order][:selected_address])
      @order.postal_code = selected_address.postal_code
      @order.address = selected_address.address
      @order.name = selected_address.name
    elsif params[:order][:address_type] == "C"
      #ストロングパラメータから取る住所
    end
    @cart_products = current_customer.cart_products
    @current_customer_address = current_customer.address
    @payment_type = @order.payment_type
    @order.postage = 800
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@order_product = OrderProduct.new(order_product_params)
    #binding.pry
    if @order.save
      @cart_products = current_customer.cart_products
      @cart_products.each do |cp|
        order_product = @order.order_products.new
        order_product.order_id = @order.id
        order_product.product_id = cp.product_id
        order_product.amount = cp.amount
        order_product.price = cp.product.price
        order_product.save
      end
      redirect_to done_orders_path
    else
      @orders = Order.all
      render 'index'
    end
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:total_payment,:payment_type,:status,:selected_address,:postage)
  end

  #def order_product_params
    #params.require(:order_product).permit(:id,:price,:amount)
  #end

end