class InvoiceClientMailer < ApplicationMailer
  def invoice_client_mail
      @invoice = params[:invoice]
      @user = User.find(params[:invoice].user_id)
      mail(to: @user.email, subject: "Votre facture a bien été réceptionnée")
    end
end
