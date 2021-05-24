# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/restaurants/1/reservations').to route_to('api/v1/reservations#index', restaurant_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/restaurants/1/reservations/1').to route_to('api/v1/reservations#show', id: '1',
                                                                                                  restaurant_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/restaurants/1/reservations').to route_to('api/v1/reservations#create', restaurant_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/restaurants/1/reservations/1').to route_to('api/v1/reservations#update', id: '1',
                                                                                                    restaurant_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/restaurants/1/reservations/1').to route_to('api/v1/reservations#update', id: '1',
                                                                                                      restaurant_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/restaurants/1/reservations/1').to route_to('api/v1/reservations#destroy', id: '1',
                                                                                                        restaurant_id: '1')
    end
  end
end
