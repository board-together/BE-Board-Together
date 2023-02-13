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
end
