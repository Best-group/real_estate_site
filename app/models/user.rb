class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  validates :username, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness:true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
  #has_secure_password
  validates :password, length: {minimum: 8}
  has_many :listings

  hash_as_id

  after_create :assign_default_role

  def assign_default_role
    add_role(:standard)
  end

end
