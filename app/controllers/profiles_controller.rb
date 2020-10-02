class ProfilesController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.profiles.new(profile_params)
    profile[:user_id] = user[:id] 
    if @profile.save
      flash[:success] = "プロフィールの登録が完了しました"
      redirect_to @profile #インスタンス変数指定の時はprofileのshowを見に行く
    else
      flash.now[:danger] = "プロフィールの登録に失敗しました"
      render :new
    end 
  end
  
  def show
    @profile = Profile.find_by(user_id: params[:id])
  end
  
  def edit
    @profile = Profile.find_by(user_id: params[:id])
  end
  
  def update
    @profile = Profile.find(params[:user_id])
    if @profile.update_attributes(profile_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @profile
    else
      render 'edit'
    end
  end 

  private
  
    def profile_params
      params.require(:profile).permit(:user_id, :user_image, :user_profile)
    end 
   
    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
    end
  
  
end
