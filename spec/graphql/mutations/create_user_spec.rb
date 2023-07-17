require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  describe 'create a user' do
    let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

    context 'happy path' do
      before { post '/graphql', params: { query: mutation('Floofything') } }

      it 'can create a user from a mutation' do
        expect(response).to be_successful
        expect(parsed_response[:data][:createUser][:user][:username]).to eq('Floofything')
        expect(parsed_response[:data][:createUser][:errors]).to eq([])
      end
    end

    context 'sad paths' do
      context 'when user field is blank' do
        before { post '/graphql', params: { query: mutation('') } }

        it 'returns an appropriate error' do
          expect(response).to be_successful
          expect(parsed_response[:data][:createUser]).to be_nil
          expect(parsed_response[:errors].first[:message]).to eq('Cannot return null for non-nullable field CreateUserPayload.user')
        end
      end

      context 'when username is not unique' do
        before do
          create(:user, username: 'Floofything')
          post '/graphql', params: { query: mutation('Floofything') }
        end

        it 'returns an appropriate error' do
          expect(response).to be_successful
          expect(parsed_response[:data][:createUser]).to be_nil
          expect(parsed_response[:errors].first[:message]).to eq('Cannot return null for non-nullable field CreateUserPayload.user')
        end
      end
    end
  end

  def mutation(username)
    <<~GQL
      mutation {
        createUser(input:{
          username: "#{username}"
        }) {
          user {
            username
          }
          errors
        }
      }
    GQL
  end
end
