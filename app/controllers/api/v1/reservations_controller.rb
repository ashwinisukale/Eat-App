# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :current_user
      before_action :set_restaurant, only: %i[index create]
      before_action :set_reservation, only: %i[show update destroy]
      before_action :can_reservation?

      # GET /api/v1/restaurants/1/reservations
      def index
        @reservations = current_user.reservations.where(restaurant_id: params[:restaurant_id]).all

        render json: @reservations
      end

      # GET /api/v1/restaurants/1/reservations/1
      def show
        render json: @reservation
      end

      # POST /api/v1/reservations
      def create
        @reservation = Reservation.new(start_time: reservation_params[:start_time],
                                       status: reservation_params[:status],
                                       covers: reservation_params[:covers],
                                       notes: reservation_params[:notes],
                                       restaurant_id: @restaurant.id,
                                       user_id: current_user.id)

        if @reservation.save
          render json: @reservation, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/restaurants/1/reservations/1
      def update
        if @reservation.update(reservation_params)
          render json: @reservation
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/restaurants/1/reservations/1
      def destroy
        @reservation.destroy
        render json: { message: 'Reservation deleted successfully' }
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

      attr_reader :current_user

      # Only allow a list of trusted parameters through.
      def reservation_params
        params.require(:reservation).permit!
      end
    end
  end
end
