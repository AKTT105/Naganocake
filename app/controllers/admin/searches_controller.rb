class Admin::SearchesController < ApplicationController
  
  def search
    @model = params[:model]
    keyward = params[:keyward]
    if @model == 'customer'
      if keyward.blank?
        @title = '会員'
        @customers = Customer.page(params[:page]).per(10).reverse_order
      else
        @title = '会員'
        @customers = Customer.where("first_name LIKE?", "%#{keyward}%").page(params[:page]).per(10).reverse_order
      end
    elsif @model == 'product'
      if keyward.blank?
        @title = '商品'
        @products = Product.page(params[:page]).per(10).reverse_order
      else
        @title = '商品'
        @products = Product.where("name LIKE?", "%#{keyward}%").page(params[:page]).per(10).reverse_order
      end
    end
  end
  
end
