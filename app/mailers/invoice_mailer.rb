class InvoiceMailer < ApplicationMailer
  def invoice_mail
      @invoice = params[:invoice]
      mail(to: "contact@solutioncreance.fr", subject: "Nouvelle facture en ligne")
    end
end
