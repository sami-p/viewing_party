require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  before :each do
    @user = User.create!(username: "muffintoast", email: "muffintoast@aol.com", password: "test", password_confirmation: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @movie = Movies.new({ title: "Forrest Gump", vote_average: 8.5, id: 13, runtime: 142, backdrop_path: nil, genres: ["Comedy", "Drama", "Romance"]})

    VCR.use_cassette('movie_db_movie_party') do
      visit new_movie_party_path(@movie.id)
    end
  end

  it 'displays the movie title' do
    VCR.use_cassette('movie_db_movie_party') do
      visit new_movie_party_path(@movie.id)
      expect(page).to have_content(@movie.title)
    end
  end

  describe 'New Viewing Party Form' do
    it 'has duration field' do
      expect(page).to have_content("Duration:")
    end

    it 'has party date field' do
      expect(page).to have_content("Date:")
    end

    it 'has start time field' do
      expect(page).to have_content("Party time:")
    end

    it 'has a create party button' do
      expect(page).to have_button("Let's Party")
    end
  end

  describe 'Form functionality' do
    it 'Can create new party with invited friends' do
      user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      friendship_1 = @user.friends << user_2
      friendship_2 = @user.friends << user_3
      friendship_3 = @user.friends << user_4

      VCR.use_cassette('movie_db_movie_party') do
        @user.reload
        visit new_movie_party_path(@movie.id)

        fill_in :duration, with: 150
        fill_in :date, with: '09/14/21'
        fill_in :start_time, with: '4:00 PM'

        check "Friend_#{user_2.id}"
        check "Friend_#{user_3.id}"
        check "Friend_#{user_4.id}"

        click_on "Let's Party"

        expect(current_path).to eq(dashboard_index_path)
      end
    end

    it 'Sets default duration to movie runtime if duration is blank' do
      user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      friendship_1 = @user.friends << user_2
      friendship_2 = @user.friends << user_3
      friendship_3 = @user.friends << user_4

      VCR.use_cassette('movie_db_movie_party') do
        @user.reload
        visit new_movie_party_path(@movie.id)

        fill_in :date, with: '09/14/21'
        fill_in :start_time, with: '4:00 PM'

        check "Friend_#{user_2.id}"
        check "Friend_#{user_3.id}"
        check "Friend_#{user_4.id}"

        click_on "Let's Party"

        expect(current_path).to eq(dashboard_index_path)
      end
    end

    it 'Will not create the party id duration is set to less than movie runtime' do
      user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      friendship_1 = @user.friends << user_2
      friendship_2 = @user.friends << user_3
      friendship_3 = @user.friends << user_4

      VCR.use_cassette('movie_db_movie_party_2') do
        @user.reload
        visit new_movie_party_path(@movie.id)

        fill_in :duration, with: 100
        fill_in :date, with: '09/14/21'
        fill_in :start_time, with: '4:00 PM'

        check "Friend_#{user_2.id}"
        check "Friend_#{user_3.id}"
        check "Friend_#{user_4.id}"

        click_on "Let's Party"
        expect(current_path).to eq(new_movie_party_path(@movie.id))
        expect(page).to have_content('Please fill in all fields correctly to create a new party. Thank you!')
      end
    end

    it 'will not create new party with fields other than duration are left blank' do
      user_2 = User.create(username: "jelly", email: "jellybelly@comcast.net", password: "test2", password_confirmation: "test2")
      user_3 = User.create(username: "jam", email: "we.be.jammin@aol.com", password: "test3", password_confirmation: "test3")
      user_4 = User.create(username: "butter", email: "butterupbuttercup@isbutteracarb.com", password: "test4", password_confirmation: "test4")

      @user.friends << user_2
      @user.friends << user_3
      @user.friends << user_4

      VCR.use_cassette('movie_db_movie_party_2') do
        @user.reload
        visit new_movie_party_path(@movie.id)

        fill_in :duration, with: 150
        fill_in :start_time, with: '4:00 PM'

        click_on "Let's Party"
        expect(current_path).to eq(new_movie_party_path(@movie.id))
        expect(page).to have_content('Please fill in all fields correctly to create a new party. Thank you!')
      end
    end

    it 'will not render Friends Invited portion if user has no friends' do
      expect(page).to_not have_content('Friends Invited')
    end
  end
end
