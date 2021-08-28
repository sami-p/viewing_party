class MoviesController < ApplicationController 
  def index 
  end

  def show 
   @movie_details = MovieDbService.get_movie(params[:id])
   @reviews = MovieDbService.list_reviews(params[:id])
  end 
end 