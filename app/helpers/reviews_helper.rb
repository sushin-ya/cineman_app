module ReviewsHelper
  def reviewed?(movie)
    !current_user.reviews.exists?(movie.id)
  end

  def reviewed_id(movie)
    current_user.reviews.find_by(movie_id: movie.id)
  end

  def rate(movie)
    Review.where(movie_id: movie.id).all.average(:rate)
  end

  def count(movie)
    Review.where(movie_id: movie.id).all.count
  end
end
