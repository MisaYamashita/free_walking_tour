class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver   #app/mailer/inquiry_mailerでsend_mailを定義している
      redirect_to inquiries_path
      flash.now[:success] = "問い合わせ内容を送信しました" #表示されない。。
    end 
  end
  
  private
    def inquiry_params
      params.require(:inquiry).permit(:title, :message, :email)
    end 
end
