require 'rails_helper'

RSpec.describe Mutations::UpdateUserGame, type: :request do
  before :each do
    @user = create(:user)
    @user2 = create(:user)
    @game = create(:game)
    @user_game = @user.user_games.create!(game_id: @game.id)
  end

  describe 'update user game' do
    describe 'happy path' do
      it 'can update game and user game from mutation' do
        post '/graphql', params: { query: query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:updateUserGame][:userGame]).to have_key(:id)
        expect(parsed_response[:data][:updateUserGame][:userGame]).to have_key(:borrowerId)
        expect(parsed_response[:data][:updateUserGame][:userGame]).to have_key(:status)
        expect(parsed_response[:data][:updateUserGame][:userGame][:status]).to eq(1)
        expect(parsed_response[:data][:updateUserGame]).to have_key(:errors)

        expect(parsed_response[:data][:updateUserGame][:errors]).to be_a(Array)
        expect(parsed_response[:data][:updateUserGame][:userGame][:id]).to be_a(String)
        expect(parsed_response[:data][:updateUserGame][:userGame][:borrowerId]).to be_an(Integer)
        expect(parsed_response[:data][:updateUserGame][:userGame][:status]).to be_a(Integer)
      end
    end

    describe 'sad paths' do
      it 'will raise an appropriate error if the UserGame ID is not found' do
        post '/graphql', params: { query: invalid_user_game_id_query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(parsed_response[:data][:updateUserGame]).to eq(nil)
        expect(parsed_response[:errors].first[:message]).to eq("Cannot return null for non-nullable field UpdateUserGamePayload.userGame")
      end

      it 'will raise an appropriate error if a UserGame ID is not given' do
        post '/graphql', params: { query: no_user_game_id_query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(parsed_response[:errors].first[:message]).to eq("Argument 'id' on InputObject 'UpdateUserGameInput' has an invalid value (\"\"). Expected type 'Int!'.")
      end

      it 'will raise an appropriate error if a malformed query is used' do
        post '/graphql', params: { query: malformed_query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(parsed_response[:errors].first[:message]).to include("Parse error on")
      end
    end
  end

  def query
    <<~GQL
      mutation {
        updateUserGame(input:
          {
            id: #{@user_game.id},
            borrowerId: #{@user2.id},
            status: 1
          })
          {
          userGame {
                    id
                    borrowerId
                    status
                  }
            errors
          }
        }
    GQL
  end

  def invalid_user_game_id_query
    <<~GQL
      mutation {
        updateUserGame(input:
          {
            id: 450,
            borrowerId: #{@user2.id},
            status: 1
          })
          {
          userGame {
                    id
                    borrowerId
                    status
                  }
            errors
          }
        }
    GQL
  end

  def no_user_game_id_query
    <<~GQL
      mutation {
        updateUserGame(input:
          {
            id: "",
            borrowerId: #{@user2.id},
            status: 1
          })
          {
          userGame {
                    id
                    borrowerId
                    status
                  }
            errors
          }
        }
    GQL
  end

  def malformed_query
    <<~GQL
      mutation {
        updateUserGame(input:
          {
            id: #{@user_game.id},
            borrowerId: #{@user2.id},
            status: 1
          })
          {
           {
              id
              borrowerId
              status
            }
          errors
          }
        }
    GQL
  end
end
