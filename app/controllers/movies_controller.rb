class MoviesController < ApplicationController 
  def index 
  end

  def show 
   @movie_details = MovieFacade.new.get_movie(params[:id])
   @reviews = MovieFacade.new.list_reviews(params[:id])
   @cast = MovieFacade.new.movie_cast(params[:id])
  end 
end 