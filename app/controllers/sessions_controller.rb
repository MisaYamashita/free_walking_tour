class SessionsController < ApplicationController
  def new
  end
  
  def create
#    auth = request.env['omniauth.auth']  #SNS認証用
#    if auth.present?
#      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
#      session[:user_id] = user.id
#      flash[:success] = "ユーザー認証が完了しました。"
#      redirect_to user_path(id: :user_id)
    if
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'メールアドレス、またはパスワードに誤りがあります'
        render 'new'
      end
    end 
  end 
  
  def destroy
    log_out
    redirect_to root_path, info: 'ログアウトしました'
  end 
  
  private
    def email_params
      params.require(:session).permit(:email)
    end 
    
    def password_params
      params.require(:session).permit(:password)
    end 
    
  
  
  #ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end 
  
end
