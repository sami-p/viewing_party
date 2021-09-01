require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do
    @user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_index_path
  end
  it 'displays user welcome message' do
    expect(page).to have_content("My name is #{@user.username}, and I like to party!")
  end

  it 'can take the user to discover movies page' do
    VCR.use_cassette('movie_db_discover_movies') do
      click_on 'Discover'

      expect(current_path).to eq('/discover')
      expect(page).to have_content('Discover Movies!')
    end
  end

  describe 'friends' do
    before :each do
      @user_1 = User.create(username: "april4", email: "april4@example.com", password: "showers04", password_confirmation: "showers04")
      @user_2 = User.create(username: "may5", email: "may5@example.com", password: "flowers05", password_confirmation: "flowers05")
      @user_3 = User.create(username: "june6", email: "june6@example.com", password: "beaches06", password_confirmation: "beaches06")
      @user_1.friends << @user_2
      @user_1.friends << @user_3

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path
    end

    it 'has a search to add a friend by email' do
      expect(page).to have_field(:search)
      expect(page).to have_button('Add Friend')
    end

    it 'adds a new friend to friend list' do
      user = User.create(username: "july5", email: "july5@example.com", password: "redwhiteandblue07", password_confirmation: "redwhiteandblue07")

      fill_in :search, with: user.email
      click_button "Add Friend"

      @user_1.reload
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path

      expect(current_path).to eq(dashboard_index_path)
      within(".friends") do
        expect(page).to have_content(user.username)
      end
    end

    it 'returns an error if friend is not in system' do
      fill_in :search, with: "july5@example.com"
      click_button "Add Friend"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("I'm sorry your friend cannot be found")
      within(".friends") do
        expect(page).to_not have_content("july5")
      end
    end

    it 'lists all friends' do
      within(".friends") do
        expect(page).to have_content(@user_2.username)
        expect(page).to have_content(@user_3.username)
      end
    end

    it 'displays message if there are no friends' do
      user = User.create(username: "july5", email: "july5@example.com", password: "redwhiteandblue07", password_confirmation: "redwhiteandblue07")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      within(".friends") do
        expect(page).to have_content('You currently have no friends.')
        expect(page).to_not have_content(@user_2.username)
        expect(page).to_not have_content(@user_3.username)
      end
    end

    it 'can log user out' do
      user = User.create(username: "july5", email: "july5@example.com", password: "redwhiteandblue07", password_confirmation: "redwhiteandblue07")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      expect(page).to have_content('july5')

      click_on 'Logout'
      expect(current_path).to eq(root_path)
    end
  end

  describe 'Viewing Parties' do
    it 'lists all of your viewing parties' do
      user = User.create(username: "smores12", email: "marshmallow@grahamcrackers.com", password: "chocolate&fire", password_confirmation: "chocolate&fire")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      user_2 = User.create(username: "hotcoco", email: "tiny_marshmallows@aol.com", password: "test", password_confirmation: "test")
      user_3 = User.create(username: "applecider", email: "cinnamon.apple@comcast.net", password: "test", password_confirmation: "test")
      user_4 = User.create(username: "bonfire", email: "lets.go.camping@gmail.com", password: "test", password_confirmation: "test")

      user.friends << user_2
      user.friends << user_3
      user.friends << user_4

      user_2.friends << user
      user_2.friends << user_3

      movie = Movies.new({ title: "Forrest Gump", vote_average: 8.5, id: 13, runtime: 142, backdrop_path: nil, genres: ["Comedy", "Drama", "Romance"]})
      movie_2 = Movies.new({ title: "Goodfellas", vote_average: 9, id: 14, runtime: 145, backdrop_path: nil, genres: ["Comedy", "Drama", "Romance"]})

      party = Party.create(host: user, movie_title: "Forrest Gump", start_time: Time.parse('2021-10-31 20:00:00 UTC'), duration: 155, movie_runtime: 150)
      party_2 = Party.create(host: user_2, movie_title: "Goodfellas", start_time: Time.parse('2021-10-25 20:00:00 UTC'), duration: 170, movie_runtime: 150)

      party.users << user_2
      party.users << user_3
      party.users << user_4

      party_2.users << user
      party_2.users << user_3

      visit dashboard_index_path

      save_and_open_page

      expect(page).to have_content("Parties You Are Invited To:")
      expect(page).to have_content("Goodfellas")
      expect(page).to have_content(party_2.start_time.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(user.username)
      expect(page).to have_content(user_3.username)

      expect(page).to have_content("Parties You Are Hosting:")
      expect(page).to have_content("Forrest Gump")
      expect(page).to have_content(party.start_time.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(user_2.username)
      expect(page).to have_content(user_3.username)
      expect(page).to have_content(user_4.username)
    end
  end
end
