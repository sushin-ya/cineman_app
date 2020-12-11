class Admin::MoviesController < Admin::Base
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie), notice: "「#{@movie.title}」を登録しました。"
    else
      render :new
    end
  end

  def update
    movie = Movie.find(params[:id])
    movie.update!(movie_params)
    redirect_to admin_movies_path, notice: "「#{movie.title}」を更新しました。"
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to admin_movies_path, notice: "「#{movie.title}」を削除しました。"
  end

  private

  def movie_params
    params.require(:movie).permit(
      :title,
      :production_year,
      :screening_date,
      :country_of_origin,
      :screening_time,
      :director,
      :description,
      :image
    )
  end
end
