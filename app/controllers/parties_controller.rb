class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.new.get_movie(params[:movie_id])
    @friends = current_user.friends
  end

  def create
    party_params[:start_date] = params[:date] + params[:start_time]
    party = Party.create(party_params)
    params[:Friend].each do |friend, check|
      if check == "1"
        PartyGuest.create(party: party, user: User.find(friend))
        UserMailer.with(user: User.find(friend), party: party).viewing_email.deliver_later
      end
    end
    if !params[:date].empty? && party.save
      redirect_to dashboard_index_path
    else
      flash[:notice] = 'Please fill in all fields correctly to create a new party. Thank you!'
      redirect_to new_movie_party_path
    end
  end

  private

  def party_params
    params.permit(:duration, :start_time, :movie_title, :host_id, :movie_runtime)
  end
end
