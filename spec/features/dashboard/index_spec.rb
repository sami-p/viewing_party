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
    click_on 'Discover'

    expect(current_path).to eq('/discover')
  end

  it 'can take the user to discover movies page' do 
    click_on 'Discover'

    expect(current_path).to eq('/discover')
    expect(page).to have_content('Discover Movies!')
  end
end
