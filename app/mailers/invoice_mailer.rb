class InvoiceMailer < ApplicationMailer
  def invoice_mail
      @invoice = params[:invoice]
      mail(to: "h.g.mancini@gmail.com", subject: "Nouvelle facture en ligne")
    end
end
