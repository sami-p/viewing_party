require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before :each do
    @user = User.create!(username: "muffintoast", email: "muffintoast@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @movie = Movies.new({ title: "GoodFellas", vote_average: 8.5, id: 13, runtime: 142, backdrop_path: nil, genres: ["Comedy", "Drama", "Romance"]})

    # Figure out API / VCR and cassette usage

    # VCR.use_cassette('movie_db_movie_details') do
    #   click_on "GoodFellas"
    # end
    visit new_movie_party_path(@movie.id)
  end

  xit 'displays the movie title' do
    expect(page).to have_content(@movie.title)
  end

  describe 'New Viewing Party Form' do
    xit 'has duration field' do
      expect(page).to have_content("Duration:")
    end

    xit 'has party date field' do
      expect(page).to have_content("Date:")
    end

    xit 'has start time field' do
      expect(page).to have_content("Party time:")
    end

    xit 'has a create party button' do
      expect(page).to have_button("Let's party")
    end
  end

  describe 'Form functionality' do
    xit 'Can create new party with invited friends' do
      @user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      @user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      @user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      @user.friends << @user_2
      @user.friends << @user_3
      @user.friends << @user_4

      fill_in 'Duration:', with: 150
      fill_in 'Date:' with: '09/14/21'
      fill_in 'Party Time:', with: '4:00 PM'

      check "#{@user_2.username}"
      check "#{@user_3.username}"
      check "#{@user_4.username}"

      click_on "Let's Party"
      expect(current_path).to eq(dashboard_index_path)
      # should redirect back to dashboard where you see your viewing parties
    end

    xit 'Sets default duration to movie runtime if duration is blank' do
      @user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      @user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      @user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      @user.friends << @user_2
      @user.friends << @user_3
      @user.friends << @user_4

      # Tests blank duration field : make sure to create default movie runtime functionality
      fill_in 'Date:' with: '09/14/21'
      fill_in 'Party Time:', with: '4:00 PM'

      check "#{@user_2.username}"
      check "#{@user_3.username}"
      check "#{@user_4.username}"

      click_on "Let's Party"
      expect(current_path).to eq(dashboard_index_path)
      # add expect to check duration of movie.runtime?
    end

    xit 'Will not create the party id duration is set to less than movie runtime' do
      @user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      @user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      @user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      @user.friends << @user_2
      @user.friends << @user_3
      @user.friends << @user_4

      # Set up duration field with verification of duration > movie.runtime
      # Set up flash message that the duration must be greater than or equal to the movie runtime
      fill_in 'Duration:', with: 100
      fill_in 'Date:' with: '09/14/21'
      fill_in 'Party Time:', with: '4:00 PM'

      check "#{@user_2.id}"
      check "#{@user_3.id}"
      check "#{@user_4.id}"

      click_on "Let's Party"
      expect(current_path).to eq(new_movie_party_path(@movie.id)
      expect(page).to have_content('Cannot create Viewing Party if duration is less than movie runtime. Please enter correct duration.')
    end

    it 'will not create new party with fields other than duration are left blank' do
      @user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      @user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      @user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      @user.friends << @user_2
      @user.friends << @user_3
      @user.friends << @user_4

      # Create verification of date and party time
      # Create flash message for when the form is not filled out correctly
      # Make sure form is correctly set up with date_time value for date and party time
      fill_in 'Duration:', with: 150
      fill_in 'Party Time:', with: '4:00 PM'

      expect(current_path).to eq(new_movie_party_path(@movie.id)
      expect(page).to have_content('Please fill in all necessary fields to create a new party. Thank you!')
    end

    it 'will not render Friends Invited portion if user has no friends' do
      expect(page).to_not have_content('Friends Invited')
    end
  end
end
