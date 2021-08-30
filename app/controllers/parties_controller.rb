class PartiesController < ApplicationController

  def new
    @movie = MovieDbService.get_movie(params[:movie_id])
    @friends = current_user.friends
  end

# Change to drop down for date and time ?
  def create
    require "pry"; binding.pry
    party[:start_time] = (params[:date], params[:start_time])
  end
end 
