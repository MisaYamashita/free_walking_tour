class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      to:'mi-426-sa@hotmail.co.jp',
      subject: 'Free Walking Tour 問い合わせ通知'
    )
  end 
end
