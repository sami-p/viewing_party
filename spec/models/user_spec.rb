require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:parties) }
    it { should have_many(:party_guests) }
    it { should have_many(:parties).through(:party_guests) }
  end

  describe 'class methods' do
    describe '.search_email' do
      it 'can search by email address' do
        user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")
        expect(User.search_email("funbucket@aol.com")).to eq(user)
        expect(User.search_email("funbuc@aol.com")).to_not eq(user)
      end
    end
  end
end
