class TourContactMailer < ApplicationMailer
  def send_mail(tour_contact)
    @tour_contact = tour_contact
    mail(
      to:'mi-426-sa@hotmail.co.jp',
      subject: 'Free Walking Tour ツアー詳細　問い合わせ通知'
    )
  end 
end
