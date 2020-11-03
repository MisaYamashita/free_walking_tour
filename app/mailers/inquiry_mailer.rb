class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      to: ENV['EMAIL_ADDRESS'],
      subject: 'Free Walking Tour 問い合わせ通知'
    )
  end 
end
