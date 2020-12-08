module StaticPageHelper
  def rate(movie)
    Review.where(movie_id: movie.id).all.average(:rate)
  end

  def count(movie)
    Review.where(movie_id: movie.id).all.count(:movie_id)
  end

end
