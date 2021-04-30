    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [:show, :update]
      STATUS = ["En attente", "En cours de traitement", "Créance recouvrée", "Fermée"]
      # GET /invoices
      def index
        @invoices = Invoice.all

        # render json: @invoices
      end

      def debtor_index
        @invoices = Invoice.where(debtor_id: params["debtor_id"])
        render json: @invoices
      end

      # GET /invoices/1
      def show
        render json: @invoice
      end

      # POST /invoices
      def create

        @invoice = Invoice.new(item_params)
        result = Cloudinary::Uploader.upload(invoice_params[:picture])
        @invoice.file = result["url"]
        @invoice.status = "En attente"
        # attach_main_pic(@invoice)
        if @invoice.save!
          InvoiceMailer.with(invoice: @invoice).invoice_mail.deliver_later
          InvoiceClientMailer.with(invoice: @invoice).invoice_client_mail.deliver_later
          render json: @invoice, status: :created, location: @invoice
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /invoices/1
      def update
        if @invoice.update(invoice_params)
          render json: @invoice
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      # DELETE /invoices/1
      def destroy
        @invoice = Invoice.find(params[:id].to_i)
        p 'inside destroy'
        p @invoice
        if @invoice.destroy
          render json: "Invoice deleted"
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_invoice
          p Invoice.last
          p Invoice.last.id
          p params[:id]
          p params[:id].class
          p params[:id].to_i
          p params[:id].to_i.class
          @invoice = Invoice.find(118)
        end

        def attach_main_pic(item)
          item.file.attach(invoice_params[:picture])
        end

        def item_params
          {
            amount: invoice_params[:amount],
            user_id: invoice_params[:user_id],
          }
        end


        # Only allow a trusted parameter "white list" through.
        def invoice_params
          params.permit!
        end
    end

