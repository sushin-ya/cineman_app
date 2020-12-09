class ScreenwritersController < ApplicationController
  def index
    @screenwriters = Screenwriter.all
  end

  def movies
    screenwriter = Screenwriter.find(params[:screenwriter_id])
    @movies = screenwriter.movies
  end
end
