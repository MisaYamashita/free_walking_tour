class Admin::UsersController < ApplicationController
  before_action :admin_user
  
  helper_method :admin_user
  
  def index
    @search_users = User.all.search(params[:search])
    #@search_users = User.paginate(page: params[:page], per_page: 15)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to(admin_users_path)
  end
  

  private
  
  #Adminユーザーかどうか
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
