class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update, :destroy]
  
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
      #flash.now[:danger] = "登録に失敗しました"   パーシャルで埋め込みでメッセージ対応
      render :new
    end 
  end
  
  def show
    @user = User.find(params[:id])
  end
    
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
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
