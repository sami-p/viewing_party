class FriendshipsController < ApplicationController
  def create
    if User.search_email(params[:friendship][:search])
      friend = friendship_params
      friend[:user_id] = current_user.id
      friend[:friend_id] = User.search_email(params[:friendship][:search]).id
      new_friend = Friendship.create(friend)
      redirect_to dashboard_index_path
    else
      flash[:error] = "I'm sorry your friend cannot be found"
      redirect_to dashboard_index_path
    end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
