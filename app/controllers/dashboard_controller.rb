class DashboardController < ApplicationController
  def index
    @user = User.find_by(params[:id])
    @friendships = Friendship.new
  end
end
