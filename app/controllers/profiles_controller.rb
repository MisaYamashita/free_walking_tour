class ProfilesController < ApplicationController
  before_action :correct_user, only: [:new, :create, :edit, :update]
  before_action :find_id, only: [:show, :edit, :update]
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:success] = "プロフィールの登録が完了しました"
      redirect_to profiles_show_path(current_user.id) 
    else
      flash.now[:danger] = "プロフィールの登録に失敗しました"
      render :new
    end 
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to profiles_show_path(current_user.id)
    else
      render :edit
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
    
    def find_id
      @profile = Profile.find_by(user_id: params[:id])
    end 
  
end
