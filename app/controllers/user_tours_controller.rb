class UserToursController < ApplicationController
  #ツアー参加テーブル
  before_action :logged_in_user
  
  def create
    @user_tour = UserTour.new
    @user_tour.user_id = current_user.id
    @user_tour.tour_id = params[:tour_id]    
    if @user_tour.save
     flash[:success] = "このツアーに参加します"
     redirect_to tour_path(@user_tour.tour_id)
    end 
  end

  def destroy
    @user_tour = UserTour.find_by(user_id: current_user.id, tour_id: params[:tour_id])
    @user_tour.destroy
    flash[:success] = "このツアーへの参加を中止しました"
    redirect_to tour_path(@user_tour.tour_id)
  end
end
