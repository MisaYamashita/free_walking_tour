class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレス、またはパスワードに誤りがあります'
      render 'new'
    end 
  end 
  
  def destroy
    log_out
    redirect_to root_path, info: 'ログアウトしました'
  end 
  
  private
    def email_params
      params.require(:sesstion).permit(:email)
    end 
    
    def password_params
      params.require(:session).permit(:password)
    end 
  
end
