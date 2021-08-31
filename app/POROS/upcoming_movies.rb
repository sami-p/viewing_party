class UpcomingMovies
  attr_reader :title, 
              :vote_average,
              :id,
              :poster,
              :overview

  def initialize(data)
    @title            = data[:title]
    @vote_average     = data[:vote_average]
    @id               = data[:id]
    @poster           = data[:poster_path]
    @overview         = data[:overview]
  end     

  def render_image
    "https://image.tmdb.org/t/p/w500#{@poster}" unless @poster.nil?
  end
end 