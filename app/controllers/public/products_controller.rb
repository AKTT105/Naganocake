class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.where(is_active: true)
    @products = Product.where(is_active: true, genre_id: @genres.ids).page(params[:page]).per(8).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.where(is_active: true)
    @cart_product = CartProduct.new
  end

  def search
    @genres = Genre.where(is_active: true)
    @value = params['value']
    @genre = Genre.find_by(id: @value)
    @products = Product.where(genre_id: @value, is_active: true).page(params[:page]).per(8).reverse_order
  end

end
