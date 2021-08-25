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
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Join the Party"

    expect(page).to have_content("Welcome, #{username}!")
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
    fill_in :password, with: password
    fill_in :password_confirmation, with: "wrongPassword"

    click_on "Join the Party"

    expect(page).to have_content("Please fill in all required fields")
  end
end 