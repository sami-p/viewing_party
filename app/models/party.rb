class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_many :party_guests, dependent: :destroy
  has_many :users, through: :party_guests

  validates_presence_of :start_time
  validates :duration, numericality: { greater_than_or_equal_to: :movie_runtime }

end
