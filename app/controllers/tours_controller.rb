class ToursController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  
  def index
    @search_tours = Tour.from_today.paginate(page: params[:page], per_page: 10)
  end 
  
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    @tour.images.to_json
    if @tour.save
      redirect_to tour_path(@tour.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tour.update(tour_params)
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
      params.require(:tour).permit(:user_id, :title, :date, {images: []}, :detail, :latitude, :longitude, :address)
    end
    
    def find_id
      @tour = Tour.find(params[:id])
    end 
    
end
