class Public::HomesController < ApplicationController

  def top
    @genres = Genre.where(is_active: true)
    @products = Product.where(is_active: true, genre_id: @genres.ids).page(params[:page]).per(4)
  end

  def about
  end

end
