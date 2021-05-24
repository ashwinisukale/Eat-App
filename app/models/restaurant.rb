# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :cuisines, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :location, presence: true
  validates :open_hours, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :users
  has_many :guests
  has_many :reservations
end
