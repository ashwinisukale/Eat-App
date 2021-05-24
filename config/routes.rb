# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentication#login'
  namespace :api do
    namespace :v1 do
      resources :restaurants do
        resources :guests
        resources :reservations
      end
    end
  end
end
