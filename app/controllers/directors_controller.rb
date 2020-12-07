class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def movies
    @director = Director.find(params[:director_id])
    @movies = @director.movies.order("updated_at DESC").all.page(params[:page])
  end


  def new
    @director = Director.new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to directors_url, notice: "「#{@director.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    director = Director.find(params[:id])
    director.update!(director_params)
    redirect_to directors_url, notice: "「#{director.name}」を更新しました。"
  end

  def destroy
    director = Director.find(params[:id])
    director.destroy
    redirect_to directors_url, notice: "「#{director.name}」を削除しました。"
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end
