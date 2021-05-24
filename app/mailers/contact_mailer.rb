class ContactMailer < ApplicationMailer
  def contact_mail
      @user = params[:user]

      mail(to: @user.email, subject: "Votre compte a bien été créé !")
    end
end
