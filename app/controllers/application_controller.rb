class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  include SessionsHelper
  include ProfilesHelper
  include ToursHelper
  
  #コントローラーで定義したメソッドをviewでも使いたい場合は、ここに記載する
  helper_method :current_user, :logged_in?, :has_profile?, :current_user_admin
  
  
  #入力されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end 
  
  #現在ログイン中のユーザーを表示する
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end 
  end 
  
  #Adminユーザーかどうか
  def current_user_admin
    user = User.find(session[:user_id])
    if user.admin == true
      return true
    end 
  end 
  
  #ユーザーがログインしているか
  def logged_in?
    !current_user.nil?
  end
  
  
  #ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end 
  
  
end
