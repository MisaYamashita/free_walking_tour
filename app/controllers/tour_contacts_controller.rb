class TourContactsController < ApplicationController
  def new
    @tour_contact = TourContact.new
    @tour_contact.tour_id = params[:id] #newのURIにidがあるため、そのidをtour_idに代入する
  end

  def create
    @tour_contact = TourContact.new(tour_contact_params)
    if @tour_contact.save
      TourContactMailer.send_mail(@tour_contact).deliver   #app/mailer/tour_contact_mailerでsend_mailを定義している
      flash.keep[:success] = "問い合わせ内容を送信しました"
      redirect_to tour_contacts_new_path
    else
      render 'new'
    end 
  end
  
  private
    def tour_contact_params
      params.require(:tour_contact).permit(:tour_id, :name, :email, :title, :message)
    end 
end
