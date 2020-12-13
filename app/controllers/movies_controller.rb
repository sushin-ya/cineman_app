class MoviesController < ApplicationController
  def index
    @movies = Movie.find(Review.group(:movie_id).order('count(movie_id) desc').pluck(:movie_id))
  end

  def search
    @q = Movie.search(search_params)
    @movies = @q.result(distinct: true)
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.order("updated_at DESC").page(params[:page]).per(10)
  end

  private

  def search_params
    params.require(:q).permit(:title_cont)
  end
end
