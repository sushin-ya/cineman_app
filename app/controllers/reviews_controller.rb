class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.page(params[:page])
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

  def edit; end

  def update; end

  def destroy; end

  private

  def review_params
    params.require(:review).permit(:body, :user_id, :movie_id)
  end
end
