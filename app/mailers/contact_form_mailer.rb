class ContactFormMailer < ApplicationMailer
  def contact_form_mail
      @contact = params[:contact]
      mail(to: "h.g.mancini@gmail.com", subject: "Nouveau contact !")
    end
end
