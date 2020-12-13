class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params[:model]
    @keyward = params[:keyward]
    if @model == 'customer'
      if @keyward.blank?
        @title = '会員'
        @customers = Customer.page(params[:page]).per(10).reverse_order
      else
        @title = '会員'
        @keyward.split(/[[:blank:]]+/).each do |keyward|
          @customers = Customer.where("first_name LIKE? OR last_name LIKE?", "%#{keyward}%", "%#{keyward}%").page(params[:page]).per(10).reverse_order
        end
      end
    elsif @model == 'product'
      if @keyward.blank?
        @title = '商品'
        @products = Product.page(params[:page]).per(10).reverse_order
      else
        @title = '商品'
        @products = Product.where("name LIKE?", "%#{@keyward}%").page(params[:page]).per(10).reverse_order
      end
    end
  end

end
