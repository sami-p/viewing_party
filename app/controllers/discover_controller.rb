class DiscoverController < ApplicationController
  def index
    @top_movies = MovieFacade.new.top_40

    @movie_search_results = MovieFacade.new.movie_search(params[:movie_search])
    @upcoming_movies = MovieFacade.new.upcoming_movies
  end
end
