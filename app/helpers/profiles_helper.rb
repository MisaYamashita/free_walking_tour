module ProfilesHelper
  
  #ログインしているユーザーに関連付けられているプロフィールがあるか
  def has_profile?
    !current_user.profile.nil?
  end 
    
end
