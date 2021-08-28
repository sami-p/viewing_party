class MovieSearch
  attr_reader :id, 
              :name

  def initialize(data)
    @name = data[:name]
    @id   = data[:id]
  end
end 