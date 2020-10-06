class ProfilesController < ApplicationController
  #before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :correct_user,   only: [:new, :create, :edit, :update]
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:success] = "プロフィールの登録が完了しました"
      redirect_to profiles_show_path #インスタンス変数指定の時はprofileのshowを見に行く
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
    @profile = Profile.find_by(user_id: params[:id])
    if @profile.update(profile_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @profile
    else
      render 'edit'
    end
  end 

  private
  
    def profile_params
      params.require(:profile).permit(:user_id, :image, :body)
    end 
   
    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless @user == current_user
    end
  
  
end
