require 'rails_helper'

RSpec.describe MovieFacade do 
  it 'returns specific movie cast' do
    VCR.use_cassette('movie_db_movie_cast') do
      movie_cast = MovieFacade.new.movie_cast(155)

      expect(movie_cast).to be_a(Array)
      expect(movie_cast.length).to eq(10)
      expect(movie_cast.first.name).to eq('Christian Bale')
    end
  end

  it 'returns current top 40 movies' do
    VCR.use_cassette('movie_db_top_40') do
      movie_cast = MovieFacade.new.top_40

      expect(movie_cast).to be_a(Array)
      expect(movie_cast.length).to eq(40)
    end
  end

  it 'returns movie by search keyword' do
    VCR.use_cassette('movie_db_movie_search') do
      movie_search = MovieFacade.new.movie_search('Knight')

      expect(movie_search).to be_a(Array)
      expect(movie_search.length).to eq(20)
      expect(movie_search.first.title).to eq("The Green Knight")
    end
  end

  it 'returns specific movie reviews' do
    VCR.use_cassette('movie_db_movie_review') do
      movie_reviews = MovieFacade.new.list_reviews(155)

      expect(movie_reviews).to be_a(Array)
      expect(movie_reviews.length).to eq(6)
      expect(movie_reviews.first.author).to eq('tricksy')
    end
  end

  it 'returns the top rated movies page 1 data' do
    VCR.use_cassette('movie_db_top_movie_list_1') do
     top_movies = MovieFacade.new.top_movies_1_data

     expect(top_movies).to be_a(Array)
     expect(top_movies.length).to eq(20)
     expect(top_movies.first.title).to eq("Dilwale Dulhania Le Jayenge")
    end
  end

  it 'returns upcoming movies' do
    VCR.use_cassette('movie_db_upcoming_movies') do
     upcoming_movies = MovieFacade.new.upcoming_movies

     expect(upcoming_movies).to be_a(Array)
     expect(upcoming_movies.length).to eq(20)
    end
  end
end 