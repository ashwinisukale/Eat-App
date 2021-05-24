# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def can_admin?
    if !@current_user.admin?
      render json: { errors: "You are not authorized to access this resource." }, status: :unauthorized
    end
  end

  def can_reservation?
    unless @current_user.admin? || @current_user.guest? || @current_user.manager?
      render json: { errors: "You are not authorized to access this resource." }, status: :unauthorized
    end
  end

end
