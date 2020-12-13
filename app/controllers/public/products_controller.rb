class Public::ProductsController < ApplicationController

  def index
    @products = Product.where(is_active: true).page(params[:page]).per(8).reverse_order
    @genres = Genre.where(is_active: true)
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_product = CartProduct.new
  end

  def search
    @genres = Genre.all
    @value = params['value']
    @genre = Genre.find_by(id: @value)
    @products = Product.where(genre_id: @value, is_active: true).page(params[:page]).per(8).reverse_order
  end

end
