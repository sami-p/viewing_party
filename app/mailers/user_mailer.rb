class UserMailer < ApplicationMailer
  def viewing_email
    @user = params[:user]
    @party = params[:party]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Movie Viewing Party Invite!')
  end
end
