class Admin::GenresController < ApplicationController
  #before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    #binding.pry
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    #binding.pry
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "admin/genre/index"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end