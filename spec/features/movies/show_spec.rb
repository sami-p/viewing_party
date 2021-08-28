require 'rails_helper'

RSpec.describe 'Movie Details Page' do 
  before :each do 
    @user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @movie = Movies.new({ title: "batman", vote_average: 10, id: 22})

    visit discover_index_path
    click_on 'Discover Top 40 Movies'
    

  end 

  it 'is on the right page' do 
    click_on 'The Godfather'
    expect(current_path).to eq(movie_path(238))
  end

  it 'displays movie details content' do 
    click_on 'The Godfather'
    expect(current_path).to eq(movie_path(238))
    expect(page).to have_content('The Godfather')
    expect(page).to have_content('8.7')
    expect(page).to have_content('175')
  end

  it 'displays movie reviews' do 
    click_on 'The Dark Knight'
    expect(current_path).to eq(movie_path(155))
    expect(page).to have_content('Reviews')
    expect(page).to have_content('tricksy')
  end

  it 'displays the cast' do 
    click_on 'The Dark Knight'

    expect(page).to have_content('Bruce Wayne')
    expect(page).to have_content('Christian Bale')
  end 
end