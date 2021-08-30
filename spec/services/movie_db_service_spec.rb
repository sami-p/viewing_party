require 'rails_helper'

RSpec.describe MovieDbService do
  it 'returns the top rated movies page 1 data' do
    VCR.use_cassette('movie_db_top_movie_list_1') do
     top_movies = MovieDbService.top_movies_1_data

     expect(top_movies).to be_a(Array)
     expect(top_movies.length).to eq(20)
     expect(top_movies.first.title).to eq("Dilwale Dulhania Le Jayenge")
    end
  end
  # 
  it 'returns the top rated movies page 2 data' do
    VCR.use_cassette('movie_db_top_movie_list_2') do
      top_movies = MovieDbService.top_movies_2_data

      expect(top_movies).to be_a(Array)
      expect(top_movies.length).to eq(20)
      expect(top_movies.first.title).to eq("The Dark Knight")
    end
  end

  it 'returns specific movie data' do
    VCR.use_cassette('movie_db_movie_data') do
      movie = MovieDbService.get_movie(155)

      expect(movie).to be_a(Movie)
      expect(movie.title).to eq('The Dark Knight')
      expect(movie.vote_average).to eq(8.5)
      expect(movie.runtime).to eq(152)
    end
  end

  it 'returns specific movie reviews' do
    VCR.use_cassette('movie_db_movie_review') do
      movie_reviews = MovieDbService.list_reviews(155)

      expect(movie_reviews).to be_a(Array)
      expect(movie_reviews.length).to eq(6)
      expect(movie_reviews.first.author).to eq('tricksy')
    end
  end

  it 'returns specific movie cast' do
    VCR.use_cassette('movie_db_movie_cast') do
      movie_cast = MovieDbService.get_cast(155)

      expect(movie_cast).to be_a(Array)
      expect(movie_cast.length).to eq(10)
      expect(movie_cast.first.name).to eq('Christian Bale')
    end
  end

  it 'returns movie by search keyword' do
    VCR.use_cassette('movie_db_movie_search') do
      movie_search = MovieDbService.movie_search('Knight')

      expect(movie_search).to be_a(Array)
      expect(movie_search.length).to eq(20)
      expect(movie_search.first.title).to eq("The Green Knight")
    end
  end
end
