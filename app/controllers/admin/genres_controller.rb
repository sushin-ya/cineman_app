class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_url, notice: "「#{@genre.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    genre = Genre.find(params[:id])
    genre.update!(genre_params)
    redirect_to admin_genres_path, notice: "「#{genre.name}」を更新しました。"
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path, notice: "「#{genre.name}」を削除しました。"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
