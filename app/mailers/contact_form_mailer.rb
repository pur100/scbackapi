class ContactFormMailer < ApplicationMailer
  def contact_form_mail
      @contact = params[:contact]
      default from: 'contact@solutioncreance.fr'
      mail(to: "contact@solutioncreance.fr", subject: "Nouveau contact !")
    end
end
