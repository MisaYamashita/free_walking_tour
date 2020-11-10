class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  include ProfilesHelper
  
  #コントローラーで定義したメソッドをviewでも使いたい場合は、ここに記載する
  helper_method :current_user, :logged_in?, :has_profile?
  
  #現在ログイン中のユーザーを表示する
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end 
  end 
  
    #入力されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end 
  
    #ユーザーがログインしているか
  def logged_in?
    !current_user.nil?
  end
  
end 
