class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @customer = Customer.find(current_customer)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update
      redirect_to customers_my_page_path
    else
      render "edit"
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
