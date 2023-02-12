require 'rails_helper'

describe Mutations::DeleteUser, type: :request do
  let!(:user) { create(:user) }

  describe 'happy path' do
    it 'deletes a user via mutation' do
      require 'pry'; binding.pry
      post '/graphql', params: { query: mutation }

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    end
  end

  def mutation
    <<~GQL
      mutation {
      deleteUser(input: {
          id: #{user.id},
          }) {
          user {
            id
          }
        }
      }
    GQL
  end
end
