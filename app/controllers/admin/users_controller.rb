class Admin::UsersController < ApplicationController
  before_action :current_user_admin
  
  def index
    @users = User.all
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to(admin_users_path)
  end
  
  
  private
 
end
