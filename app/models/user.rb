class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum:8, maximum:20}, format: { with: /[a-zA-Z0-9]{8,20}/ }
end