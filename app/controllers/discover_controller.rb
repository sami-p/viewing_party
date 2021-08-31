class DiscoverController < ApplicationController
  def index
    @top_movies = MovieDbService.top_40

    @movie_search_results = MovieDbService.movie_search(params[:movie_search])
  end
end
