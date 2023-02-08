require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'find user' do
    it 'can query for a user by username' do
      user = FactoryBot.create(:user, username: 'bigfloof')
      game = FactoryBot.create(:user_game, user_id: user.id)

      result = BoardTogetherSchema.execute(query).as_json

      expect(result["data"]["user"]).to have_key("username")
      expect(result["data"]["user"]["username"]).to eq("bigfloof")
      expect(result["data"]["user"]["games"]).to be_an(Array)
    end
  end

  def query
    <<~GQL
    {
      user(username: "bigfloof") {
        id
        username
        games {
          id
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
    }
    GQL
  end
end