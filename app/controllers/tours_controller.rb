class ToursController < ApplicationController
  def index
    #@search_tours = Tour.where("date > ?", Date.today)
    @search_tours = Tour.all.search(params[:search])
    @search_tours = Tour.paginate(page: params[:page], per_page: 10)
  end 
  
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    if @tour.save
      redirect_to tour_path(@tour.id)
    else
      render :new
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update!(tour_params)
      flash[:success] = "ツアー内容をを変更しました"
      redirect_to tour_path(@tour.id)
    else
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:id]).delete
    redirect_to user_path(current_user.id), info: 'ツアーを削除しました'
  end
  
  private
  
    def tour_params
      params.require(:tour).permit(:user_id, :title, :date, :image, :detail, :latitude, :longitude, :address)
    end
end
