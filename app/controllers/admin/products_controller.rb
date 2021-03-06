class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find_by(id: @product.genre_id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render "edit"
    end
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
  end

end
