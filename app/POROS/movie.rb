class Movie
  attr_reader :title,
              :vote_average,
              :id,
              :runtime,
              :poster,
              :genres,
              :popularity,
              :overview

  def initialize(data)
    @title            = data[:title]
    @vote_average     = data[:vote_average]
    @id               = data[:id]
    @runtime          = data[:runtime]
    @poster           = data[:poster_path]
    @popularity       = data[:popularity]
    @genres           = get_genre(data[:genres])
    @overview         = data[:overview]
  end     


  def render_image
    "https://image.tmdb.org/t/p/w500#{@poster}" unless @poster.nil?
  end

  def get_genre(data)
    data.map do |d|
      d[:name]
    end
  end
end
