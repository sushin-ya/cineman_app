class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user,   only: %i[edit update]
  before_action :admin_user,     only: :destroy

  def top
    @movies = Movie.find(Review.group(:movie_id).order('count(movie_id) desc').limit(4).pluck(:movie_id))
    @directors = Director.first(8)
    @screenwriters = Screenwriter.first(8)
    @genres = Genre.first(10)
    @production_years = [*1910..2020].select { |num| (num % 10).zero? }
    @production_years.reverse!
    @reviews = Review.order('updated_at DESC').first(4)
  end

  def index
    @users = User.all.page(params[:page])
  end

  def reviews
    @user = User.find(params[:user_id])
    @reviews = Review.where(user_id: @user.id).order('updated_at DESC').all.page(params[:page])
  end

  def bookmarks
    user = User.find(params[:user_id])
    @movies = Movie.find(user.bookmarks.order('updated_at DESC').pluck(:movie_id))
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'ユーザを削除しました'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image, :description)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_back_or user
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
