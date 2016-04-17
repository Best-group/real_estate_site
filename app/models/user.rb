class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness:true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, length: {minimum: 8}
  has_many :listings
end
