require 'rails_helper'

RSpec.describe 'Dashboard' do
  it 'displays user welcome message' do
    user = User.create!(username: "funbucket13", email: "funbucket@aol.com", password: "test", password_confirmation: "test")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit dashboard_index_path
    save_and_open_page
    expect(page).to have_content("My name is #{user.username}, and I like to party!")
  end
end
