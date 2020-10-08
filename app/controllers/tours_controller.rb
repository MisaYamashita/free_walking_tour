class ToursController < ApplicationController
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    if @tour.save
      flash[:success] = "ツアーを作成しました"
      redirect_to @tour
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
  end

  def update
  end

  def destroy
  end
  
  private
  
    def tour_params
      params.require(:tour).permit(:user_id, :title, :date, :image, :detail, :latitude, :longitude, :address)
    end
end
