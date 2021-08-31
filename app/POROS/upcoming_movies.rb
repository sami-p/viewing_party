class UpcomingMovies
  attr_reader :title, 
              :vote_average,
              :id,
              :image

  def initialize(data)
    @title            = data[:title]
    @vote_average     = data[:vote_average]
    @id               = data[:id]
    @image            = data[:backdrop_path]
  end     

  def render_image
    "https://image.tmdb.org/t/p/w500#{@image}" unless @poster.nil?
  end
end 