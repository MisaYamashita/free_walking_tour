class Admin::UsersController < ApplicationController
  before_action :admin_user
  
  def index
    @users = User.all
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to(admin_users_path)
  end 
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
end
