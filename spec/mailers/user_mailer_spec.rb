require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "viewing email" do
    before :each do
      @user = User.create(username: "funbucket13", email: "funbucket@example.com", password: "test", password_confirmation: "test")
      @host = User.create(username: "party_host", email: "party@example.com", password: "test", password_confirmation: "test")
      @movie = Movie.new({title: 'Forest Gump', vote_average: 8.5, id: 13, runtime: 140, image: "", backdrop_path: "", genres: [{name: 'Drama'}]})
    end
    let(:mail) { UserMailer.viewing_email }

    it "renders the headers" do
      expect(mail.subject).to eq("@user.name have been invited to a viewing party!")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
