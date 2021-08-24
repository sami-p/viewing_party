require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has a welcome message' do
    visit root_path

    expect(page).to have_content('Welcome to the Party!')
  end
  it 'has a welcome message' do
    visit root_path

    description = "Viewing party is an application that lets you schedule virtual movie watch parties with your friends."

    expect(page).to have_content(description)
  end
  it 'has a log in button' do
    visit root_path

    expect(page).to have_link('Log In')
  end
  describe 'Registering a user' do
    it 'has a button to register' do
      visit root_path

      expect(page).to have_link('Register')
    end
    it 'creates a new user' do
      visit root_path

      click_on "Register"

      expect(current_path).to eq(new_user_path)

      username = "funbucket13"
      email = "funbucket13@email.com"
      password = "test"

      fill_in :user_username, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_on "Join the Party"

      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
