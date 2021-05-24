# frozen_string_literal: true

module Api
  module V1
    class GuestsController < ApplicationController
      before_action :set_restaurant
      before_action :set_guest, only: %i[show update destroy]
      before_action :can_admin?

      # GET /api/v1/restaurants/1/guests
      def index
        @guests = @restaurant.guests
        render json: @guests
      end

      # GET /api/v1/restaurants/1/guests/1
      def show
        render json: @guest
      end

      # POST /api/v1/restaurants/1/guests
      def create
        @guest = @restaurant.guests.new(guest_params)
        if @guest.save
          render json: @guest, status: :created
        else
          render json: @guest.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/restaurants/1/guests/1
      def update
        if @guest.update(guest_params)
          render json: @guest
        else
          render json: @guest.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/restaurants/1/guests/1
      def destroy
        @guest.destroy
        render json: { message: "#{@guest.first_name} #{@guest.last_name}- Guest deleted successfully" }
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_guest
        @guest = @restaurant.guests.where(id: params[:id]).first
      end

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

      # Only allow a list of trusted parameters through.
      def guest_params
        params.permit(:id)
        params.permit(:restaurant_id)
        params.require(:guest).permit!
      end
    end
  end
end
