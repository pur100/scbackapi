# frozen_string_literal: true

class LoginController < ApplicationController
  # commented to try and logout even if token expired
  # before_action :authorize_access_request!, only: [:destroy]
  before_action :authorize_refresh_request!, only: [:destroy_by_refresh]

  def create
    puts 'inside login create'
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      render json: { session: session.login, user: user, invoices: user.invoices }
    else
      render json: {error_message: "Could not log in, please check your credentials and try again"}
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    if session.flush_by_access_payload
      render json: :ok
    else
      render json: 'NOT OK', status: :unauthorized
    end
  end

  def destroy_by_refresh
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_token(found_token)
    render json: :ok
  end
end
