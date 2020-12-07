class StaticPageController < ApplicationController
  def home; end

  def frequently_qa; end

  def management; end

  def privacy; end

  def term; end

  def search_by_director
    @directors = Director.all
  end
end
