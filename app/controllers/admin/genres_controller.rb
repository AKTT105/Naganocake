class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    #binding.pry
    #@genre_id = @genre.id
    if @genre.save
      redirect_to admin_genre_path(@genre)
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    unless current_user == @Genre.user
      redirect_to genres_path
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to "admin/genres"
    else
      render "admin/genre/index"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end