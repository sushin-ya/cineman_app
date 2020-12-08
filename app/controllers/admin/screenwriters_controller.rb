class Admin::ScreenwritersController < ApplicationController
  def index
    @screenwriters = Screenwriter.all
  end

  def new
    @screenwriter = Screenwriter.new
  end

  def edit
    @screenwriter = Screenwriter.find(params[:id])
  end

  def create
    @screenwriter = Screenwriter.new(screenwriter_params)
    if @screenwriter.save
      redirect_to screenwriters_url, notice: "「#{@screenwriter.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    screenwriter = Screenwriter.find(params[:id])
    screenwriter.update!(screenwriter_params)
    redirect_to screenwriters_url, notice: "「#{screenwriter.name}」を更新しました。"
  end

  def destroy
    screenwriter = Screenwriter.find(params[:id])
    screenwriter.destroy
    redirect_to screenwriters_url, notice: "「#{screenwriter.name}」を削除しました。"
  end

  private

  def screenwriter_params
    params.require(:screenwriter).permit(:name)
  end
end
