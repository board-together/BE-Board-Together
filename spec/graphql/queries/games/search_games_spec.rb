require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'find games' do
    it 'can query for games by name' do
      FactoryBot.create_list(:game, 10, name: 'cat')

      result = BoardTogetherSchema.execute(query).as_json
      require 'pry'; binding.pry
      expect(result['data']['games'].count).to eq(10)
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
        {
      }
    GQL
  end
end