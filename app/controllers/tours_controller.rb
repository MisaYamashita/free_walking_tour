class ToursController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update]
  
  def index
    @search_tours = Tour.from_today.search(params[:search]).paginate(page: params[:page], per_page: 10)
  end 
  
  def new
    @tour = Tour.new
    @tour.images.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    if @tour.save
      images_params[:images].each do |img|
        @image = Image.new
        @image.tour_id = @tour.id
        @image.src = img
        @image.save
      end 
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
      @tour.images.destroy_all
      images_params[:images].each do |img|
        @image = Image.new
        @image.tour_id = @tour.id
        @image.src = img
        @image.save
      end 
      flash[:success] = "ツアー内容をを変更しました"
      redirect_to tour_path(@tour.id)
    else
      render :edit
    end
  end

  def destroy
    Tour.find(params[:id]).destroy
    redirect_to user_path(current_user.id), info: 'ツアーを削除しました'
  end
  
  private
  
    def tour_params
      params.require(:tour).permit(:user_id, :title, :date, :detail, :latitude, :longitude, :address)
    end
    
    def images_params
      params.require(:tour).permit(images: [])
    end
    
    def find_id
      @tour = Tour.find(params[:id])
    end 
    
end
