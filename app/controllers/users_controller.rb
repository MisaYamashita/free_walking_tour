class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録が完了しました"
      redirect_to @user #ログイン後のページと同じ
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end 
  end
  
  def show
    @user_profile = current_user.profile
    #@join_tour = current_userの参加するツアー
    #@joined_tour = current_userが参加したツアー
    #@plan_tour = current_userが実施するツアー
  end 
    
  private
  
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end 
  
end
