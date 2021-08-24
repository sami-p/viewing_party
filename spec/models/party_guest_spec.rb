require 'rails_helper'

RSpec.describe PartyGuest, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
end
