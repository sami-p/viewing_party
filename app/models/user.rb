class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :parties
  has_many :party_guests
  has_many :parties, through: :party_guests

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end
