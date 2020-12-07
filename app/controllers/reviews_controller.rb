class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order("updated_at DESC").page(params[:page]).per(20)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:review][:movie_id])
    if @review.save
      redirect_to @review, notice: "レビューを登録しました。"
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)
    redirect_to reviews_path, notice: "レビューを更新しました。"
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_url, notice: "#{review.user.name}の#{review.movie.title}のレビューを削除しました。"
  end

  private

  def review_params
    params.require(:review).permit(:body, :user_id, :movie_id)
  end
end
