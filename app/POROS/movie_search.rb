class MovieSearch
  attr_reader :id,
              :title,
              :poster

  def initialize(data)
    @title  = data[:title]
    @id     = data[:id]
    @poster = data[:poster_path]
  end

  def render_image
    "https://image.tmdb.org/t/p/w500#{@poster}" unless @poster.nil?
  end
end
