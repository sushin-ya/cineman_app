module BookmarksHelper
  def bookmarked?(movie)
    !(logged_in? && current_user.movies.exists?(movie.id))
  end

  def bookmark(movie)
    Bookmark.where(movie_id: movie.id).all.count
  end
end
