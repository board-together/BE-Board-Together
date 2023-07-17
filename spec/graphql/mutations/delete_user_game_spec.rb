require 'rails_helper'

RSpec.describe Mutations::DeleteUserGame, type: :request do
  let!(:user_game) { create(:user_game) }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  describe 'delete user game' do
    context 'happy path' do
      before { post '/graphql', params: { query: query(user_game.id) } }

      it 'can delete a UserGame from database' do
        expect(response).to be_successful
        expect { UserGame.find(user_game.id) }.to raise_error(ActiveRecord::RecordNotFound)
        expect(parsed_response[:data][:deleteUserGame]).to have_key(:id)
        expect(parsed_response[:data][:deleteUserGame][:id]).to eq(user_game.id.to_s)
      end
    end

    context 'sad path' do
      context 'when UserGame ID is not found' do
        before { post '/graphql', params: { query: query('') } }

        it 'will raise an appropriate error' do
          expect(response).to be_successful
          expect(parsed_response[:data][:deleteUserGame][:id]).to be_nil
          expect(parsed_response[:data][:deleteUserGame][:errors][0]).to eq('UserGame does not exist')
        end
      end

      context 'when the request is malformed' do
        before { post '/graphql', params: { query: malformed_query(user_game.id) } }

        it 'will raise an appropriate error' do
          expect(response).to be_successful
          expect(parsed_response[:errors][0][:message]).to eq('Parse error on "}" (RCURLY) at [5, 5]')
        end
      end
    end
  end

  def query(id)
    <<~GQL
      mutation {
          deleteUserGame(input :{
              id: "#{id}",
              }) {
              id
              errors
          }
      }
    GQL
  end

  def malformed_query(id)
    <<~GQL
      mutation {
          deleteUserGame(input :{
              id: "#{id}",
              }) {
          }
      }
    GQL
  end
end
