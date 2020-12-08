class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def movies
    genre = Genre.find(params[:genre_id])
    @movies = genre.movies
  end
end
