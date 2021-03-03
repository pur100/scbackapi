class InvoiceClientMailer < ApplicationMailer
  def invoice_client_mail
      @invoice = params[:invoice]
      mail(to: "contact@solutioncreance.fr", subject: "Nouvelle facture en ligne")
    end
end
