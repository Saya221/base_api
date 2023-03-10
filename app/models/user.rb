# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid

  include BCrypt

  has_many :user_sessions

  enum role: %i[admin staff customer]

  validates :name, length: { in: 1..256 }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_hash, presence: true
  validates :age, numericality: { only_integer: true, in: 1..999 }

  def password
    @password ||= Password.new password_hash
  end

  def password=(new_password)
    @password = Password.create new_password
    self.password_hash = @password
  end
end
