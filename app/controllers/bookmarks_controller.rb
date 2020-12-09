class BookmarksController < ApplicationController
  before_action :logged_in_user

  def create
    current_user.bookmarks.create!(movie_id: params[:movie_id])
    movie = Movie.find_by(id: params[:movie_id])
    flash[:success] = "#{movie.title}をブックマークしました"
    redirect_to user_bookmarks_path(current_user)
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, movie_id: params[:id])
    bookmark.destroy
    movie = Movie.find_by(id: params[:id])
    flash[:success] = "#{movie.title}のブックマークを解除しました"
    redirect_to user_bookmarks_path(current_user)
  end

  private

  def logged_in_user
    redilect_to login_path unless logged_in?
  end
end
