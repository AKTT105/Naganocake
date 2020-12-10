class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find_by(id: current_customer)
  end

  def edit
    @customer = Customer.find_by(id: current_customer)
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
    @customer = Customer.find_by(id: current_customer)
  end

  def withdraw
    @customer = Customer.find_by(id: current_customer)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

end
