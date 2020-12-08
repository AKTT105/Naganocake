class Public::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer)
  end

  def show
    @order = Order.where(customer_id: current_customer)
    @order_products = OrderProduct.where(order_id: @order)
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
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
    @order_products = OrderProduct.where(order_id: order_params)
    @product =  Product.where(id: @order_products)
    @current_customer_address = current_customer.address
    @payment_type = @order.payment_type
    #@order.payment_type == "1"
      #put "クレジットカード"
    #else
      #put "銀行振込"
    #end
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
    params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:total_payment,:payment_type,:status,:selected_address)
  end

end