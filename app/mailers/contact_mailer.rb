class ContactMailer < ApplicationMailer
  def contact_mail
      @user = params[:user]

      mail(to: "h.g.mancini@gmail.com", subject: "Nouveau contact !")
    end
end
