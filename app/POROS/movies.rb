class Movies 
  attr_reader :title 
              :vote_average
              :release_date
              :tagline
              :overview
              :link
              :genre

  def intialize(data)
    @title        = data[:original_title]
    @vote_average = data[:vote_average]
    @release_date = data[:release_date]
    @tagline      = data[:tag_line]
    @overview     = data[:overview]
    @link         = data[:homepage]
    @genre        = data[:genres][0][:name]
  end 
end