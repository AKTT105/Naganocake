class Public::HomesController < ApplicationController

  def top
    @products = Product.page(params[:page]).per(4)
  end

end
