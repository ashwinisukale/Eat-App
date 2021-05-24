# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/authentications', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Authentication. As you add validations to Authentication, be sure to
  # adjust the attributes here as well.

  let(:restaurant) do
    Restaurant.create!(name: 'Burj', cuisines: 'veg', phone: '242342342', email: 'burj@gmail.com', location: 'Dubai',
                       open_hours: 'Mon-Fri')
  end

  let(:user) do
    User.create!(first_name: 'Ashwini', last_name: 'Sukale', email: 'ashwini@gmail.com', phone: '1234322423',
                 role: 'guest', restaurant_id: restaurant.id, password: '123456', password_confirmation: '123456')
  end

  let(:valid_attributes) do
    {
      email: user.email,
      password: user.password
    }
  end

  let(:invalid_attributes) do
    {
      email: ' ',
      password: '123456'
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # AuthenticationsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type': 'application/json' }
  end

  describe 'POST /auth/login' do
    it 'returns valid token' do
      post auth_login_path,
           params: valid_attributes, headers: valid_headers, as: :json

      result = JSON.parse(response.body)
      token = JsonWebToken.encode(user_id: user.id)
      expect(result['token']).to eq(token)
      expect(result['first_name']).to eq(user.first_name)
    end

    describe 'with invalid_attributes' do
      it 'should give error' do
        post auth_login_path,
             params: invalid_attributes, headers: valid_headers, as: :json
        result = JSON.parse(response.body)
        expect(result['error']).to eq('unauthorized')
      end
    end
  end
end
