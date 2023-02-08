require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'find games' do
    it 'can query for games by name', :vcr do

      result = BoardTogetherSchema.execute(query).as_json

      expect(result['data']['searchGames'].count).to eq(25)
    end
  end

  def query
    <<~GQL
      {
        searchGames(name: "cat") {
          boardGameAtlasId
          url
          name
          yearPublished
          minPlayers
          maxPlayers
          minPlaytime
          maxPlaytime
          minAge
          description
          thumbUrl
          imageUrl
        }
      }
    GQL
  end
end