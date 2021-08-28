require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  before :each do
    @user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @movie = Movies.new({ title: "batman", vote_average: 10, id: 22})
    VCR.use_cassette('movie_db_discover_movies') do
      visit discover_index_path
    end
    VCR.use_cassette('movie_db_discover_movies') do
      click_on 'Discover Top 40 Movies'
    end
  end

  it 'is on the right page' do
    VCR.use_cassette('movie_db_movie_details') do
      click_on 'The Godfather'
      expect(current_path).to eq(movie_path(238))
    end
  end

  it 'displays movie details content' do
    VCR.use_cassette('movie_db_movie_details') do
      click_on 'The Godfather'
      expect(current_path).to eq(movie_path(238))
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('8.7')
      expect(page).to have_content('175')
    end
  end

  it 'displays movie reviews' do
    VCR.use_cassette('movie_db_movie_detail_reviews') do
      click_on 'The Dark Knight'
      expect(current_path).to eq(movie_path(155))
      expect(page).to have_content('Reviews')
      expect(page).to have_content('tricksy')
    end
  end

  it 'displays the cast' do
    VCR.use_cassette('movie_db_movie_detail_cast') do
      click_on 'The Dark Knight'
      expect(page).to have_content('Bruce Wayne')
      expect(page).to have_content('Christian Bale')
    end
  end
end
