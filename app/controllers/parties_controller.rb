class PartiesController < ApplicationController

  def new
    @movie = MovieDbService.get_movie(params[:id])
    @friends = current_user.friends
  end

  def create
  end
end
