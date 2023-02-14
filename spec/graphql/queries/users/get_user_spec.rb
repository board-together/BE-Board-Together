require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'find user' do
    before(:each) do
      @user = FactoryBot.create(:user, username: 'bigfloof')
      @game = FactoryBot.create(:user_game, user_id: @user.id)
    end

    describe "happy path" do
      it 'can query for a user by username' do
        result = BoardTogetherSchema.execute(query).as_json

        expect(result['data']['user']).to have_key('username')
        expect(result['data']['user']['username']).to eq('bigfloof')
        expect(result['data']['user']).to have_key('userGames')
        expect(result['data']['user']['userGames']).to be_an(Array)
        expect(result['data']['user']).to have_key('borrowedGames')
        expect(result['data']['user']['borrowedGames']).to be_an(Array)
      end
    end

    describe "sad paths" do
      it "will raise appropriate errors when an invalid username is entered" do
        result = BoardTogetherSchema.execute(invalid_user_name_query).as_json

        expect(result['data']).to eq(nil)
        expect(result['errors'].first['message']).to eq("Cannot return null for non-nullable field Query.user")
      end

      it "will raise appropriate errors when no username is entered" do
        result = BoardTogetherSchema.execute(no_user_name_query).as_json

        expect(result['data']).to eq(nil)
        expect(result['errors'].first['message']).to eq("Cannot return null for non-nullable field Query.user")
      end

      it "will raise appropriate errors when a malformed query is entered" do
        result = BoardTogetherSchema.execute(invalid_user_name_query).as_json

        expect(result['data']).to eq(nil)
        expect(result['errors'].first['message']).to eq("Cannot return null for non-nullable field Query.user")
      end  
    end

    def query
      <<~GQL
        {
          user(username: "#{@user.username}") {
            id
            username
            userGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
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
            borrowedGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
                name
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
        }
      GQL
    end

    def invalid_user_name_query
      <<~GQL
        {
          user(username: "NoSuchUser") {
            id
            username
            userGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
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
            borrowedGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
                name
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
        }
      GQL
    end

    def no_user_name_query
      <<~GQL
        {
          user(username: "") {
            id
            username
            userGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
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
            borrowedGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
                name
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
        }
      GQL
    end

    def malformed_query
      <<~GQL
        {
          user(username: "#{@user.username}") {
            id
            username
             {
              id
              userId
              gameId
              status
              borrowerId
               {
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
            borrowedGames {
              id
              userId
              gameId
              status
              borrowerId
              game {
                name
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
        }
      GQL
    end
  end
end
