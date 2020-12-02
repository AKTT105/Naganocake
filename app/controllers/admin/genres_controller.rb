class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(Genre_params)
    @genre.id = Genre.id
  end

  def edit
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else
      render "edit"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
