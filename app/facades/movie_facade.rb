class MovieFacade
  def top_movies_1_data
    page_one = MovieDbService.top_movies_1_data
    page_one[:results].map do |movie|
      Movies.new(movie)
    end
  end

  def top_movies_2_data
    page_two = MovieDbService.top_movies_2_data
    page_two[:results].map do |movie|
      Movies.new(movie)
    end
  end

  def top_40
    (top_movies_2_data + top_movies_1_data).flatten
  end

  def movie_cast(movie_id)
    cast = MovieDbService.get_cast(movie_id)
    cast[:cast][0..9].map do |actor|
      MovieCast.new(actor)
    end
  end

  def movie_search(keyword)
    return if keyword.nil?

    results = MovieDbService.movie_search(keyword)
    results[:results].map do |r|
      MovieSearch.new(r)
    end
  end

  def list_reviews(movie_id)
    reviews = MovieDbService.list_reviews(movie_id)
    reviews[:results].map do |review|
      MovieReview.new(review)
    end
  end

  def get_movie(movie_id)
    details = MovieDbService.get_movie(movie_id)
    Movie.new(details)
  end

  def upcoming_movies
    movies = MovieDbService.upcoming_movies
    movies[:results].map do |movie|
      UpcomingMovies.new(movie)
    end
  end
end
