class MovieSearch
  attr_reader :id,
              :title

  def initialize(data)
    @title = data[:title]
    @id    = data[:id]
  end
end
