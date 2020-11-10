class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user #ログイン後のページと同じ
    else
      render :new
    end 
  end
  
  def show
    @user_join = User.join_tours_from_today(params[:id]) #参加予定のツアー
    @user_plan = User.plan_tours_from_today(params[:id]) #開催予定のツアー
  end
  
  def joined_past #参加したツアー
    @user_joined_past = User.joined_tours_past(params[:id]).paginate(page: params[:page], per_page: 10) 
  end 
  
  def planned_past #開催したツアー
    @user_planned_past = User.planned_tours_past(params[:id]).paginate(page: params[:page], per_page: 10) 
  end 

  private
  
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end 
   
   def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
   end
   
   
end
