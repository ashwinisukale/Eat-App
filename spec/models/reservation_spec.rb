# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:restaurant) do
    Restaurant.create!(name: 'Burj', cuisines: 'veg', phone: '242342342', email: 'burj@gmail.com', location: 'Dubai',
                       open_hours: 'Mon-Fri')
  end

  let(:user) do
    User.create!(first_name: 'Ashwini', last_name: 'Sukale', email: 'ashwini@gmail.com', phone: '1234322423',
                 role: 'guest', restaurant_id: restaurant.id, password: '123456', password_confirmation: '123456')
  end

  subject do
    described_class.new(status: 'pending', start_time: DateTime.now, covers: '3', notes: 'nA', user_id: user.id,
                        restaurant_id: restaurant.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a status' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_time' do
    subject.start_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a covers' do
    subject.covers = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a restaurant_id' do
    subject.restaurant_id = nil
    expect(subject).to_not be_valid
  end
end
