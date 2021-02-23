class ConfirmationMailer < ApplicationMailer
  def confirmation_mail
      @contact = params[:contact]
      mail(to: @contact.email, subject: "Votre message à Solution Créance a bien été reçu.")
    end
end
