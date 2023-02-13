require 'rails_helper'

RSpec.describe Mutations::CreateUserGame, type: :request do
  before :each do
    @user = create(:user)
  end

  describe 'create user game' do
    describe 'happy path' do
      it 'can create game and user game from mutation' do
        post '/graphql', params: { query: query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:createUserGame]).to have_key(:user)
        expect(parsed_response[:data][:createUserGame][:user]).to have_key(:userGames)
        expect(parsed_response[:data][:createUserGame][:user][:userGames]).to be_a(Array)
        expect(parsed_response[:data][:createUserGame][:user][:userGames][0]).to have_key(:game)
        expect(parsed_response[:data][:createUserGame][:user][:userGames][0][:status]).to eq(0)
        expect(parsed_response[:data][:createUserGame][:user][:userGames][0][:borrower_id]).to eq(nil)
      end
    end
  end

  def query
    <<~GQL
      mutation {
        createUserGame(input: {
          userId: #{@user.id},
          boardGameAtlasId: "OIXt3DmJU0",
          url: "https://www.boardgameatlas.com/game/OIXt3DmJU0/catan",
          name: "Catan",
          yearPublished: "1995",
          minPlayers: "3",
          maxPlayers: "4",
          minPlaytime: "45",
          maxPlaytime: "90",
          minAge: "10",
          description: "settlers of catan",
          thumbUrl: "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg",
          imageUrl: "https://s3-us-west-1.amazonaws.com/5cc.images/games/uploaded/1629324722072.jpg"
        }) {
          user {
            id
            username
            userGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
                id#{'  '}
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
        }
      }
    GQL
  end
end
