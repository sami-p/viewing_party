class DiscoverController < ApplicationController 
  def index
   @movies1 = MovieDbService.top_movies_1_data
   @movies2 = MovieDbService.top_movies_2_data
  end 
end 