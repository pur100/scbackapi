# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_access_request!, only: [:show]

  def create
    p user_params
    @user = User.new(user_params)
    puts "----------------------------------------"
    p @user.valid?
    if @user.save!
      puts "user saved"
      if @user.authenticate(params[:password])
        payload = { user_id: @user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        ContactMailer.with(user: @user).contact_mail.deliver_later
        render json: { session: session.login, user: @user }
      else
        render json: 'Invalid user', status: :unauthorized
      end
      # render json: { current_user: current_user.to_json, user: user.to_json }
    else
      render json: { errors: @user.errors.full_messages, custom: "fuuuuuck" }
    end
  end

  def show
    puts "inside user show"
    @user = User.find(params[:id])
    debtors = @user.debtors
    invoices = Invoice.where("user_id = #{@user.id}")
    render json: {  user: @user.to_json, debtors: debtors, invoices: invoices}
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :tel, :first_name, :last_name, :company_name, :siret)
  end
end
