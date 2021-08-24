class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :parties
  has_many :party_guests
  has_many :parties, through: :party_guests
end
