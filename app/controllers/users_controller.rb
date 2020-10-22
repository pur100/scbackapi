# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_access_request!

  def create
    user = User.new(user_params)
    if user.save!
      mail(to:"h.g.mancini@gmail.com", subject: 'You the man :)')
      render json: { current_user: current_user.to_json, user: user.to_json }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def show
    user = User.find(params[:id])
    debtors = user.debtors
    invoices = Invoice.where("user_id = #{user.id}")
    render json: { current_user: current_user.to_json, user: user.to_json, debtors: debtors, invoices: invoices}
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
