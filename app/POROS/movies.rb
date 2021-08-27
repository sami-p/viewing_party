class Movies 
  attr_reader :title, 
              :vote_average,
              :release_date,
              :tagline,
              :overview,
              :link,
              :genre,
              :id

  def initialize(data)
    @title        = data[:title]
    @vote_average = data[:vote_average]
    @release_date = data[:release_date]
    @tagline      = data[:tag_line]
    @overview     = data[:overview]
    @link         = data[:homepage]
    @id           = data[:id]
  end 
end