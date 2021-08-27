require 'rails_helper'

RSpec.describe 'Dashboard' do
  it 'displays user welcome message' do
    user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    expect(page).to have_content("My name is #{user.username}, and I like to party!")
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
    it 'has a search to add a friend by email'
    it 'adds a new friend to friend list'
    it 'returns an error if friend is not in system'
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
  end
end
