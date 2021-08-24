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

  def login
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to root_path #change to user dashboard 
    else 
      flash[:error] = "Sorry, please fill in a valid username and password."
      render :login_form
    end 
  end 

  def login_form 
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
