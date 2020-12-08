class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def search
    @q = Movie.search(search_params)
    @movies = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit(:title_cont)
  end
end
