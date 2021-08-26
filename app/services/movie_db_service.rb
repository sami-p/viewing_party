class MovieDbService
  def self.top_movies_1_data
    response = Faraday.get('https://api.themoviedb.org/3/movie/top_rated?api_key=2172b1ab927658beccfded65332110d6&language=en-US&page=1')
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.top_movies_2_data
    response = Faraday.get('https://api.themoviedb.org/3/movie/top_rated?api_key=2172b1ab927658beccfded65332110d6&language=en-US&page=2')
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end
end
