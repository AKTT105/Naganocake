class Public::DeliveriesController < ApplicationController
    
  def index
    @deliveries = Delivery.where(customer_id: current_customer)
    @delivery = Delivery.new
  end
  
  def create
    @delivery = Delivery.new(delivery_params)
    @customer = Customer.find_by(id: current_customer)
    @delivery.customer_id = @customer.id
    @deliveries = Delivery.where(customer_id: current_customer)
    if @delivery.save
      flash[:notice] = ""
      redirect_to deliveries_path
    else
      flash[:notice] = "error"
      render :index
    end
  end
  
  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    #@delivery = Delivery.find(params[:id])
    @deliveries = Delivery.where(customer_id: current_customer)
    if @deliveries.update(delivery_params)
      flash[:notice] = ""
      redirect_to deliveries_path
    else
      flash[:notice] = "error"
      render :index
    end
  end
  
  def destroy
      @delivery = Delivery.find(params[:id])
      @delivery.destroy
      redirect_to deliveries_path
  end
  
 private
  def delivery_params
      params.require(:delivery).permit(:name, :postal_code, :address, :customer_id)
  end
end
