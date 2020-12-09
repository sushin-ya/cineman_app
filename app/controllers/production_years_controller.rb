class ProductionYearsController < ApplicationController
  def index
    @production_years = [*1940..2020].select { |num| (num % 10).zero? }
  end

  def movies
    start_year = params[:production_year_id]
    end_year = start_year.to_i + 9
    @movies = Movie.where(production_year: start_year.to_s..end_year.to_s).all
  end
end
