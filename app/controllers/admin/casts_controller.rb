class Admin::CastsController < ApplicationController
  def index
    @casts = Cast.all
  end

  def new
    @cast = Cast.new
  end

  def edit
    @cast = Cast.find(params[:id])
  end

  def create
    @cast = Cast.new(cast_params)
    if @cast.save
      redirect_to admin_casts_path, notice: "「#{@cast.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    cast = Cast.find(params[:id])
    cast.update!(cast_params)
    redirect_to admin_casts_path, notice: "「#{cast.name}」を更新しました。"
  end

  def destroy
    cast = Cast.find(params[:id])
    cast.destroy
    redirect_to admin_casts_path, notice: "「#{cast.name}」を削除しました。"
  end

  private

  def cast_params
    params.require(:cast).permit(:name)
  end
end
