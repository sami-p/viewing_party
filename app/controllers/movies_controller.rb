class MoviesController < ApplicationController 
  def index 
  end

  def show 
   @movie_details = MovieDbService.get_movie(params[:id])
   @reviews = MovieDbService.list_reviews(params[:id])
   @cast = MovieDbService.get_cast(params[:id])
  end 
end 