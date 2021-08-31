class UserMailerPreview < ActionMailer::Preview
  def viewing_email
    UserMailer.with(user: User.find(3), party: Party.first).viewing_email
  end
end
