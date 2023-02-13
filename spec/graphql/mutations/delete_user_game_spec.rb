require 'rails_helper'

RSpec.describe Mutations::DeleteUserGame, type: :request do
  let!(:user_game) { create(:user_game) }

  describe 'delete user game' do
    describe 'happy path' do
      it 'can delete a UserGame from database' do
        post '/graphql', params: { query: query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect { UserGame.find(user_game.id) }.to raise_error(ActiveRecord::RecordNotFound)
        expect(parsed_response[:data][:deleteUserGame]).to have_key(:id)
        expect(parsed_response[:data][:deleteUserGame][:id]).to eq(user_game.id.to_s)
      end
    end

    describe 'sad path' do
      it 'will raise an appropriate error if the UserGame ID is not found' do
        post '/graphql', params: { query: no_id_query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:deleteUserGame][:id]).to eq(nil)
        expect(parsed_response[:data][:deleteUserGame][:errors][0]).to eq('UserGame does not exist')
      end

      it 'will raise an appropriate error if for a malformed request' do
        post '/graphql', params: { query: malformed_query }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:errors][0][:message]).to eq('Parse error on "}" (RCURLY) at [5, 5]')
      end
    end
  end

  def query
    <<~GQL
      mutation {
          deleteUserGame(input :{
              id: #{user_game.id},
              }) {
              id
              errors
          }
      }
    GQL
  end

  def no_id_query
    <<~GQL
      mutation {
          deleteUserGame(input :{
              id: "",
              }) {
              id
              errors
          }
      }
    GQL
  end

  def malformed_query
    <<~GQL
      mutation {
          deleteUserGame(input :{
              id: #{user_game.id},
              }) {
          }
      }
    GQL
  end
end
