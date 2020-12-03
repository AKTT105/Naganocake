class Admin::CustomersController < ApplicationController
    
  def index
    @customer = Customer.all
  end

  def create
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Signed in successfully."
      redirect_to admin_path(@customer)
    else
      flash[:notice] = "error"
      render :new
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
    flash[:notice] = "Signed out successfully."
    redirect_to new_admin_session_path
    end
  end

  def show
   @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "successfully"
      redirect_to admin_customers_path
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :phone_number, :email, :is_deleted)
  end
end