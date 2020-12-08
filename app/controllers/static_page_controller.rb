class StaticPageController < ApplicationController
  def home; end

  def frequently_qa; end

  def management; end

  def privacy; end

  def term; end

  def search_by_director
    @directors = Director.all
  end

  def search_by_count
    @movies = Movie.find(Review.group(:movie_id).order('count(movie_id) desc').pluck(:movie_id))
  end
end
