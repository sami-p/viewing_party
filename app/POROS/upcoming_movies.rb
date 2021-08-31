class Movie
  attr_reader :title, 
              :vote_average,
              :id,
              :image,
              :backdrop_path,
              :genres


  def initialize(data)
    @title            = data[:title]
    @vote_average     = data[:vote_average]
    @id               = data[:id]
    @image            = data[:backdrop_path]
    @genres           = get_genre(data[:genres])
  end     

  def render_image
    "https://image.tmdb.org/t/p/w500#{@backdrop_path}" unless @poster.nil?
  end
end 