class Public::HomesController < ApplicationController

  def top
    @products = Product.page(params[:page]).per(4)
    @genres = Genre.all
  end

end
