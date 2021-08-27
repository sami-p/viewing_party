class DashboardController < ApplicationController
  def index
    require "pry"; binding.pry
    @user = User.find_by(params[:id])
  end
end
