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
end
