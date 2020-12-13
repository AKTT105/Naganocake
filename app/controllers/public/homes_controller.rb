class Public::HomesController < ApplicationController

  def top
    @products = Product.where(is_active: true).page(params[:page]).per(4)
    @genres = Genre.where(is_active: true)
  end

  def about
  end

end
