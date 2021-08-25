require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")

    visit login_path

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.username}")
  end
  
  it "cannot log in with bad credentials" do
    user = User.create(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")


    # we don't have to go through root_path and click the "I have an account" link any more
    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, please fill in a valid username and password.")
  end
end
