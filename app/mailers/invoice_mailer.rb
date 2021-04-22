class InvoiceMailer < ApplicationMailer
  def invoice_mail
      @invoice = params[:invoice]
      @user = User.find(params[:invoice].user_id)
      mail(to: "contact@solutioncreance.fr", subject: "Nouvelle facture en ligne")
    end
end
