class UserToursController < ApplicationController
  #ツアー参加テーブル
  
  def create
    user_tour = User_tours.new
    user_tour.user_id = current_user.id
    user_tour.tour_id = params[:tour_id]    
    if user_tour.save
     flash[:success] = "このツアーに参加します"
     redirect user_tours_path(tour.id)
    end 
  end

  def destroy
    tour = Tour.find(params[:tour_id])
    current_user.remove_tour(tour)
    flash[:success] = "このツアーへの参加を中止しました"
    redirect user_tours_path
  end
end
