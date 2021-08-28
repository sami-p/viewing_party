class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :party_guests, dependent: :destroy
  has_many :users, through: :party_guests
end
