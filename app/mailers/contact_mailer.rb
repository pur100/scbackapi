class ContactMailer < ApplicationMailer
  def contact_mail
      @user = params[:user]

      mail(to: "contact@solutioncreance.fr", subject: "Nouveau contact !")
    end
end
