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

  def self.get_cast(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIE_API']}&language=en-US")
    body = response.body
    cast = JSON.parse(body, symbolize_names: true)
    cast[:cast][0..9].map do |actor|
      MovieCast.new(actor)
    end
  end

  def self.movie_search(keyword)
    return if keyword.nil?
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API']}&query=#{keyword}&page=1&include_adult=false")
    body = response.body
    results = JSON.parse(body, symbolize_names: true)
    results[:results].map do |r|
      MovieSearch.new(r)
    end
  end
end
