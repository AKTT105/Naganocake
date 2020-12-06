class Public::SearchesController < ApplicationController
  
  def search
    @genres = Genre.all
    @value = params["search"]["value"]
    @genre = Genre.find_by(id: @value)
    @products = Product.where(genre_id: @value) 
  end
 
  
  
end
