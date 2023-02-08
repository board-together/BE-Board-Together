require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  describe 'create a user' do
    describe 'happy path' do
      it 'can create a user from a mutation' do
        post '/graphql', params: { query: mutation }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:createUser][:user][:username]).to eq('Floofything')
        expect(parsed_response[:data][:createUser][:errors]).to eq([])
      end
    end

    describe 'sad paths' do
      it 'returns an appropriate error if user field is blank' do
        post '/graphql', params: { query: bad_mutation }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:createUser]).to eq(nil)
        expect(parsed_response[:errors].first[:message]).to eq('Cannot return null for non-nullable field CreateUserPayload.user')
      end

      it 'returns an appropriate error if username is not unique' do
        create(:user, username: 'Floofything')
        post '/graphql', params: { query: mutation }

        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data][:createUser]).to eq(nil)
        expect(parsed_response[:errors].first[:message]).to eq('Cannot return null for non-nullable field CreateUserPayload.user')
      end
    end
  end
end

def mutation
  <<~GQL
    mutation {
    createUser(input:{
      username: "Floofything"
      }) {
      user {
            username
          }
        errors
        }
    }
  GQL
end

def bad_mutation
  <<~GQL
    mutation {
    createUser(input:{
      username: ""
      }) {
      user {
            username
          }
        errors
        }
    }
  GQL
end
