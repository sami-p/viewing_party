class DashboardController < ApplicationController
  def index
    @friendships = Friendship.new
  end
end
