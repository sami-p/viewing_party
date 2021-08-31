require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "viewing email" do
    before :each do
      @host = User.create!(username: "party_host", email: "party@example.com", password: "test", password_confirmation: "test")
      @user = User.create!(username: "funbucket13", email: "funbucket@example.com", password: "test", password_confirmation: "test")
      @party = Party.create!(host: @host, movie_title: 'Forest Gump', start_time: Time.parse('2021-08-31 20:00:00 UTC'), duration: 150, movie_runtime: 140)
    end
    let(:mail) { UserMailer.with(user: @user, party: @party).viewing_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Movie Viewing Party Invite!")
      expect(mail.to).to eq(["funbucket@example.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content('funbucket13 have been invited to a viewing party!')
      expect(mail.body.encoded).to have_content('You have been invited to party_host viewing party!')
      expect(mail.body.encoded).to have_content('Movie Title: Forest Gump')
      expect(mail.body.encoded).to have_content('Duration of party: 150')
      expect(mail.body.encoded).to have_content('Date: 08/31/21')
      expect(mail.body.encoded).to have_content('Time: 08:00 pm')
      expect(mail.body.encoded).to have_content('Party Time! Excellent!')
    end
  end
end
