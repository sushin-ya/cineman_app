module BookmarksHelper
  def bookmarked?(movie)
    !current_user.movies.exists?(movie.id)
  end
end
