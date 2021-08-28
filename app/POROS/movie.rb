class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :image,
              :backdrop_path,
              :genres

  def initialize(data)
    @title            = data[:title]
    @vote_average     = data[:vote_average]
    @id               = data[:id]
    @runtime          = data[:runtime]
    @backdrop_path    = data[:backdrop_path]
    @genres           = get_genre(data[:genres])
  end

  def render_image
    "https://image.tmdb.org/t/p/w500#{@backdrop_path}" unless @poster.nil?
  end

  def get_genre(data)
    data.map do |d|
      d[:name]
    end
  end
end
