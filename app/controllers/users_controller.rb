class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = user_params
    user[:username] = user[:username].downcase
    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to root_path #change to dashboard
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
