class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy
  has_many :party_guests, dependent: :destroy
  has_many :parties, through: :party_guests

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_confirmation, presence: true
  validates :password, require: true, presence: true

  has_secure_password

  def self.search_email(params)
    find_by(email: params)
  end
end
