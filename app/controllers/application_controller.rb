# frozen_string_literal: true

# Fallback to Base for Rails < 5
if Rails::VERSION::MAJOR < 5
  ActionController::API = ActionController::Base
end

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def not_authorized
    puts "inside application controller not_authorized"
    render json: { error: 'Application controller !!!!! Not authorized' }, status: :unauthorized
  end
end
