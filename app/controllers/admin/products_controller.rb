class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  private

  def book_params
    params.require(:product).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
  end

end
