class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_search

  def set_search
    @search = Movie.ransack(params[:q])
    @search_movie = @search.result.page(params[:page])
  end
end
