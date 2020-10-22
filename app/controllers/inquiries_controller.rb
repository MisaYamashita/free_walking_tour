class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver   #app/mailer/inquiry_mailerでsend_mailを定義している
      #flash.keep[:success] = "問い合わせ内容を送信しました" #keepにすることで、redirectした後のページでも表示される
      redirect_to inquiries_path
    else
      render 'new'
    end
  end
  
  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :title, :message)
    end 
end
