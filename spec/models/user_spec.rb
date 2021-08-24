require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:parties) }
    it { should have_many(:party_guests) }
    it { should have_many(:parties).through(:party_guests) }
  end
end
