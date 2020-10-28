class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  
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
    @user = User.find(params[:id]).joined_tours.where("date > ?", Date.today)
    @user_tour = User.find(params[:id]).tours.where("date > ?", Date.today)
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
