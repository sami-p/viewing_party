class PartiesController < ApplicationController

  def new
    @movie = MovieDbService.get_movie(params[:movie_id])
    @friends = current_user.friends
  end

  def create
    party_params[:start_date] = params[:date] + params[:start_time]
    party = Party.create(party_params)
    params[:Friend].each do |friend, check|
      if check == 1
        PartyGuests.create(party_id: party, user_id: friend)
      end
    end
    redirect_to dashboard_index_path
  end

  private

  def party_params
    params.permit(:duration, :start_time, :movie_title, :host_id)
  end
end
