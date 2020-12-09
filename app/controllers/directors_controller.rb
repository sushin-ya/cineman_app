class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def movies
    director = Director.find(params[:director_id])
    @movies = director.movies
  end
end
