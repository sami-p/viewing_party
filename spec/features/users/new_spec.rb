require 'rails_helper'

RSpec.describe 'New User Page' do 
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