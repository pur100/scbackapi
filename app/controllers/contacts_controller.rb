class ContactsController < ApplicationController
    def index
      @contacts = Contact.all

      render json: @contacts
    end

    # GET /contacts/1
    def show
      render json: @contact
    end

    # POST /contacts
    def create
      puts "inside create printing CONTACGT -------------------"
      @contact = Contact.new(contact_params)
      p @contact

      if @contact.save!
        ContactFormMailer.with(contact: @contact).contact_form_mail.deliver_later
        ConfirmationMailer.with(contact: @contact).confirmation_mail.deliver_later
        p "SENDING MAILS !!!!"
        render json: @contact, status: :created, location: @contact
      else
        puts "--------------------------------------------ELSE NOT SAVING"
        render json: @contact.errors, status: :ok
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        params.permit(:first_name, :last_name, :email, :message, :company, :siren, :siret, :company_name, :company_address, :company_zip, :company_city, :phone)
      end
end
