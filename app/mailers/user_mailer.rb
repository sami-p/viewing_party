class UserMailer < ApplicationMailer
  def viewing_email
    @user = params[:user] # need to add multiple params for friend/host?
    @url  = 'http://example.com/login' # need to be viewing url?
    mail(to: @user.email, subject: 'Movie Viewing Party Invite!')
  end
end
