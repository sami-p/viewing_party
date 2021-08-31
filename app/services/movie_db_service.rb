class MovieDbService < ApiService

  def self.top_movies_1_data
    get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API']}&language=en-US&page=1")
  end

  def self.top_movies_2_data
    get_data("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API']}&language=en-US&page=2")
  end
  
  def self.get_movie(movie_id)
    get_data("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_API']}&language=en-US")
  end

  def self.list_reviews(movie_id)
    get_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API']}&language=en-US")

  end

  def self.get_cast(movie_id)
    get_data("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIE_API']}&language=en-US")
 
  end

  def self.movie_search(keyword)
    get_data("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API']}&query=#{keyword}&page=1&include_adult=false")
  end

  def self.upcoming_movies
    get_data("https://api.themoviedb.org/3/movie/upcoming?api_key=#{ENV['MOVIE_API']}&language=en-US&page=1")
  end 
end
