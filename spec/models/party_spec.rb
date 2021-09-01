require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'Associations' do
    it { should belong_to(:host) }
    it { should have_many(:party_guests) }
    it { should have_many(:users).through(:party_guests) }
  end

  describe 'Class Methods' do
    it 'can find host of the party' do
      user = User.create(username: "smores12", email: "marshmallow@grahamcrackers.com", password: "chocolate&fire", password_confirmation: "chocolate&fire")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      movie = Movies.new({ title: "Forrest Gump", vote_average: 8.5, id: 13, runtime: 142, backdrop_path: nil, genres: ["Comedy", "Drama", "Romance"]})

      party = Party.create(host: user, movie_title: "Forrest Gump", start_time: Time.parse('2021-10-31 20:00:00 UTC'), duration: 155, movie_runtime: 150)

      expect(party.host).to eq(user)
    end
  end
end
