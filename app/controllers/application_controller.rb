class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  include SessionsHelper
  
  helper_method :current_user, :logged_in?, :has_profile
  
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
  
  #ユーザーがログインしているか
  def logged_in?
    !current_user.nil?
  end
  
  
  #ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end 
  
  #ログインしているユーザーに関連付けられているプロフィールがあるか
  def has_profile?
    @profile.user_id.blank?
  end 
    
end
