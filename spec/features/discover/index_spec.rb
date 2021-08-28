require 'rails_helper'

RSpec.describe "Discover Movies Page" do
  before :each do
    @user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'is on the right page' do
    VCR.use_cassette('movie_db_discover_movies') do
      visit '/discover'

      expect(current_path).to eq('/discover')
    end
  end

  it 'displays discover movies content' do
    VCR.use_cassette('movie_db_discover_movies') do
      visit '/discover'

      expect(page).to have_content("Discover Movies!")
    end
  end

  it 'can stop showing Discover Top 40 movies' do
    VCR.use_cassette('movie_db_discover_movies') do
      visit '/discover'
    end
    VCR.use_cassette('movie_db_discover_movies') do
      click_on 'Discover Top 40 Movies'

      expect(page).to have_content("Top Movies")
      expect(page).to_not have_content('Discover Top 40 Movies')
    end
  end

  it 'can display top 40 movies and average vote' do
    VCR.use_cassette('movie_db_discover_movies') do
      visit '/discover'
    end
    VCR.use_cassette('movie_db_discover_movies') do
      click_on 'Discover Top 40 Movies'

      expect(page).to have_content("Top Movies")
      expect(page).to_not have_content('Discover Top 40 Movies')
      expect(page).to have_content("Evangelion: 3.0+1.0 Thrice Upon a Time")
      expect(page).to have_content("8.8")
    end
  end
end
