require 'rails_helper'

RSpec.describe MovieDbService do
  it 'returns the top rated movies page 1 data' do
    mock_response = "{\"page\":1,\"results\":[{\"adult\":false,\"backdrop_path\":\"/1EAxNqdkVnp48a7NUuNBHGflowM.jpg\",\"genre_ids\":[16,28,18,878],\"id\":283566,\"original_language\":\"ja\",\"original_title\":\"\xE3\x82\xB7\xE3\x83\xB3\xE3\x83\xBB\xE3\x82\xA8\xE3\x83\xB4\xE3\x82\xA1\xE3\x83\xB3\xE3\x82\xB2\xE3\x83\xAA\xE3\x82\xAA\xE3\x83\xB3\xE5\x8A\x87\xE5\xA0\xB4\xE7\x89\x88:||\",\"overview\":\"In the aftermath of the Fourth Impact, stranded without their Evangelions, Shinji, Asuka, and Rei find refuge in one of the rare pockets of humanity that still exist on the ruined planet Earth. There, each of them live a life far different from their days as an Evangelion pilot. However, the danger to the world is far from over. A new impact is looming on the horizon\xE2\x80\x94one that will prove to be the true end of Evangelion.\",\"popularity\":303.968,\"poster_path\":\"/jDwZavHo99JtGsCyRzp4epeeBHx.jpg\",\"release_date\":\"2021-03-08\",\"title\":\"Evangelion: 3.0+1.0 Thrice Upon a Time\",\"video\":false,\"vote_average\":8.8,\"vote_count\":239}]}"

   allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
   allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)

   top_movies = MovieDbService.top_movies_1_data

   expect(top_movies).to be_a(Array)
   expect(top_movies.length).to eq(1)
   expect(top_movies.first.title).to eq("Evangelion: 3.0+1.0 Thrice Upon a Time")
  end

  it 'returns the top rated movies page 2 data' do
    mock_response = "{\"page\":2,\"results\":[{\"adult\":false,\"backdrop_path\":\"/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg\",\"genre_ids\":[18,28,80,53],\"id\":155,\"original_language\":\"en\",\"original_title\":\"The Dark Knight\",\"overview\":\"Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.\",\"popularity\":62.158,\"poster_path\":\"/qJ2tW6WMUDux911r6m7haRef0WH.jpg\",\"release_date\":\"2008-07-16\",\"title\":\"The Dark Knight\",\"video\":false,\"vote_average\":8.5,\"vote_count\":25692}]}"

   allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
   allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)

   top_movies = MovieDbService.top_movies_2_data

   expect(top_movies).to be_a(Array)
   expect(top_movies.length).to eq(1)
   expect(top_movies.first.title).to eq("The Dark Knight")
  end
end
