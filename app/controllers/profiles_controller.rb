class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = current_user.profiles.new(profile_params)
    
    if @profile.save
      flash[:success] = "プロフィールの登録が完了しました"
      redirect_to @profile
    else
      flash.now[:danger] = "プロフィールの登録に失敗しました"
      render :new
    end 
  end
  
  def show
    @profile = Profile.find(params[:user_id])
  end 

  private
  
    def profile_params
      params.require(:profile).permit(:user_id, :user_image, :user_profile)
    end 
   
  
  
end
