# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :role, presence: true

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  belongs_to :restaurant
  has_many :reservations

  def downcase_email
    self.email = email.delete(' ').downcase
  end

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end

  def manager?
    role == 'manager'
  end
end
