class TourContactsController < ApplicationController
  def new
    @tour_contact = TourContact.new
  end

  def create
    @tour_contact = TourContact.new(tour_contact_params)
    if @tour_contact.save
      TourContactMailer.send_mail(@tour_contact).deliver   #app/mailer/tour_contact_mailerでsend_mailを定義している
      flash.now[:success] = "問い合わせ内容を送信しました" #表示されない。。
      redirect_to tour_contacts_new_path
    else
      flash.now[:danger] = "問い合わせ内容を送信できませんでした"
      redirect_to tour_contacts_new_path
    end 
  end
  
  private
    def tour_contact_params
      params.require(:tour_contact).permit(:name, :email, :title, :message)
    end 
end
