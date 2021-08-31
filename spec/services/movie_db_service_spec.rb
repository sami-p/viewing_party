require 'rails_helper'

RSpec.describe MovieDbService do
  it 'returns the top rated movies page 1 data' do
    VCR.use_cassette('movie_db_top_movie_list_1') do
     top_movies = MovieDbService.top_movies_1_data

     expect(top_movies).to be_a(Hash)
     expect(top_movies[:results].first).to have_key(:adult)
     expect(top_movies[:results].first).to have_key(:title)
    end
  end

  it 'returns the top rated movies page 2 data' do
    VCR.use_cassette('movie_db_top_movie_list_2') do
      top_movies = MovieDbService.top_movies_2_data

      expect(top_movies).to be_a(Hash)
      expect(top_movies[:page]).to eq(2)
      expect(top_movies[:results].count).to eq(20)
    end
  end

  it 'returns specific movie data' do
    VCR.use_cassette('movie_db_movie_data') do
      movie = MovieDbService.get_movie(155)

      expect(movie).to be_a(Hash)
      expect(movie).to have_key(:homepage)
      expect(movie).to have_key(:popularity)
    end
  end

  it 'returns specific movie reviews' do
    VCR.use_cassette('movie_db_movie_review') do
      movie_reviews = MovieDbService.list_reviews(155)

      expect(movie_reviews).to be_a(Hash)
      expect(movie_reviews[:results].first).to have_key(:author)
      expect(movie_reviews[:results].first).to have_key(:content)
    end
  end

  it 'returns specific movie cast' do
    VCR.use_cassette('movie_db_movie_cast') do
      movie_cast = MovieDbService.get_cast(155)

      expect(movie_cast).to be_a(Hash)
      expect(movie_cast[:cast].first).to have_key(:adult)
      expect(movie_cast[:cast].first).to have_key(:character)
      expect(movie_cast[:cast].first).to have_key(:name)
    end
  end

  it 'returns movie by search keyword' do
    VCR.use_cassette('movie_db_movie_search') do
      movie_search = MovieDbService.movie_search('Knight')

      expect(movie_search).to be_a(Hash)
      expect(movie_search[:results].first).to have_key (:overview)
      expect(movie_search[:results].first).to have_key (:title)
    end
  end

  it 'returns movie by search keyword' do
    VCR.use_cassette('movie_db_upcoming_movies') do
      upcoming_movies = MovieDbService.upcoming_movies

      expect(upcoming_movies).to be_a(Hash)
      expect(upcoming_movies[:results].first).to have_key (:overview)
      expect(upcoming_movies[:results].first).to have_key (:title)
    end
  end
end
