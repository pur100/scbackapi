class DebtorsController < ApplicationController
  before_action :set_debtor, only: [:show, :update, :destroy]
  before_action :authorize_access_request! #, except: [:show, :index]


  # GET /debtors
  def index

    @debtors = Debtor.all

    render json: @debtors
  end

  def user_index
    @debtors = Debtor.where(user_id: params["user_id"])
    render json: @debtors
  end

  # GET /debtors/1
  def show
    render json: @debtor
  end

  # POST /debtors
  def create
    @debtor = Debtor.new(debtor_params)

    if @debtor.save
      render json: @debtor, status: :created, location: @debtor
    else
      render json: @debtor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debtors/1
  def update
    if @debtor.update(debtor_params)
      render json: @debtor
    else
      render json: @debtor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /debtors/1
  def destroy
    @debtor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debtor
      @debtor = Debtor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def debtor_params
      params.permit(:siret, :contact_name, :contact_phone, :contact_mail, :user_id, :active)
    end
end


