require 'bcrypt'

class User < ApplicationRecord
  has_one :wallet, as: :walletable, dependent: :destroy
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  # Secure password handling with bcrypt
  has_secure_password
end
