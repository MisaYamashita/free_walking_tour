class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    if @tour.save
      flash[:success] = "ツアーを作成しました"
      redirect_to users_tours_show_path
    else
      flash.now[:danger] = "ツアーの作成に失敗しました"
      render :new
    end
  end

  def show
    @tour = Tour.find(params[:id])
    gon.tour = @tour
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update!(tour_params)
      flash[:success] = "ツアー内容をを変更しました"
      redirect_to users_tours_show_path
    else
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.delete(:tour_id)
    redirect_to user_path, info: 'ツアーを削除しました'
  end
  
  private
  
    def tour_params
      params.require(:tour).permit(:user_id, :title, :date, :image, :detail, :latitude, :longitude, :address)
    end
end
