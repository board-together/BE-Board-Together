require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  describe 'create a user' do
    it 'can create a user from a mutation' do
      post '/graphql', params: { query: mutation }

      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:createUser][:user][:username]).to eq('Floofything')
      expect(parsed_response[:data][:createUser][:errors]).to eq([])
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
end
