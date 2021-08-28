class MovieDbService
  def self.top_movies_1_data
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API']}&language=en-US&page=1")
    body = response.body
    page_one = JSON.parse(body, symbolize_names: true)
    page_one[:results].map do |movie|
      Movies.new(movie)
    end 
  end

  def self.top_movies_2_data
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API']}&language=en-US&page=2")
    body = response.body
    page_two = JSON.parse(body, symbolize_names: true)
    page_two[:results].map do |movie|
      Movies.new(movie)
    end 
  end

  def self.get_movie(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_API']}&language=en-US")
    body = response.body 
    details = JSON.parse(body, symbolize_names: true)
    Movie.new(details)
  end

  def self.list_reviews(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API']}&language=en-US")
    body = response.body 
    reviews = JSON.parse(body, symbolize_names: true)
    reviews[:results].map do |review|
      MovieReview.new(review)
    end
  end 
end

