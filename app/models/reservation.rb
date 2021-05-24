# frozen_string_literal: true

class Reservation < ApplicationRecord
  validates :status, presence: true
  validates :start_time, presence: true
  validates :covers, presence: true

  belongs_to :user
  belongs_to :restaurant
end
