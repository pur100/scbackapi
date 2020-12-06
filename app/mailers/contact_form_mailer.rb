class ContactFormMailer < ApplicationMailer
  def contact_form_mail
      @contact = params[:contact]
      mail(to: "contact@solutioncreance.com", subject: "Nouveau contact !")
    end
end
