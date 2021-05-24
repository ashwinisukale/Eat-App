# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:restaurant) do
    Restaurant.create!(name: 'Burj', cuisines: 'veg', phone: '242342342', email: 'burj@gmail.com', location: 'Dubai',
                       open_hours: 'Mon-Fri')
  end

  subject do
    described_class.new(first_name: 'Ashwini', last_name: 'Sukale', email: 'ashwini@gmail.com', phone: '1234322423',
                        role: 'guest', restaurant_id: restaurant.id, password: '123456', password_confirmation: '123456')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first_name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a last_name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a role' do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a restaurant_id' do
    subject.restaurant_id = nil
    expect(subject).to_not be_valid
  end

  describe 'when email format is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        subject.email = valid_address
        expect(subject).to be_valid
      end
    end
  end

   it { expect(subject).to respond_to(:admin?) }
   it { expect(subject).to respond_to(:guest?) }
   it { expect(subject).to respond_to(:manager?) }
end
