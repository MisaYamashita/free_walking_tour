class TourContactMailer < ApplicationMailer
  def send_mail(contact)
    @tour_contact = contact
    mail(
      to:'mi-426-sa@hotmail.co.jp',
      subject: 'Free Walking Tour ツアー詳細　問い合わせ通知'
    )
  end 
end
