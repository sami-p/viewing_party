class PartiesController < ApplicationController

  def new
    @movie = MovieDbService.get_movie(params[:movie_id])
    @friends = current_user.friends
  end

  def create
    party = Party.create(party_params)
    require "pry"; binding.pry
    party_guests = PartyGuests.create(party_guest_params)
  end

  private

  def party_params
    params.require(:party).permit(:duration, :start_time, :movie_title, :host_id)
  end
end
