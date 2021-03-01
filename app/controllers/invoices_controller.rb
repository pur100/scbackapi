    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [:show, :update, :destroy]

      # GET /invoices
      def index
        @invoices = Invoice.all

        render json: @invoices
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
        p "---------------------------------"
        result = Cloudinary::Uploader.upload(invoice_params[:picture])
        @invoice.file = result["url"]
        # attach_main_pic(@invoice)
        if @invoice.save!
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
        @invoice.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_invoice
          @invoice = Invoice.find(params[:id])
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

