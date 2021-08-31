class UserMailer < ApplicationMailer
  def viewing_email
    @user = params[:user]
    @host = params[:host]
    @movie = params[:movie]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Movie Viewing Party Invite!')
  end

  def add_to_controller
    UserMailer.with(user: @friend, host: host, movie: movie).welcome_email.deliver_later
  end
end
