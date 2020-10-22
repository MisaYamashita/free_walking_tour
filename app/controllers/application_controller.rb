class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  include SessionsHelper
  include ProfilesHelper
  include ToursHelper
  
  #コントローラーで定義したメソッドをviewでも使いたい場合は、ここに記載する
  helper_method :current_user, :logged_in?, :has_profile?
  
end 
