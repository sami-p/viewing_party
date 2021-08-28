require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before :each do
    visit new_party_path
  end

  it 'displays the movie title' do
    save_and_open_page
    expect(page).to have_content("Your Party's Featured Film:")
  end

  describe 'New Viewing Party Form' do
    it 'contains party duration field' do
      expect(page).to have_content("Duration: ")
    end

    xit 'can set a default duration as movie runtime' do
    end

    xit 'will not create the party id duration is set to less than movie runtime' do
    end

    it 'contains party date field' do
      expect(page).to have_content("Date:")
    end

    it 'contains start time field' do
      expect(page).to have_content("Party time:")
    end

    it 'contains checkable boxes next to possible invited friends' do
      expect(page).to have_content("Friends invited")
    end

    it 'has a create party button' do
      expect(page).to have_button("Let's party")
    end
  end
end
