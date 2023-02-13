require 'rails_helper'

describe Mutations::DeleteUser, type: :request do
  before(:each) do
    @user = create(:user)
  end

  describe 'happy path' do
    it 'deletes a user via mutation' do
      expect(User.count).to eq(1)
      post '/graphql', params: { query: happy_path_mutation }

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key :data
      expect(parsed_response[:data]).to be_a Hash
      expect(parsed_response[:data]).to have_key :deleteUser
      expect(parsed_response[:data][:deleteUser]).to be_a Hash
      expect(parsed_response[:data][:deleteUser]).to have_key :id
      expect(parsed_response[:data][:deleteUser][:id]).to eq("#{@user.id}")
      expect(User.count).to eq(0)
    end
  end

  describe 'sad path' do
    it 'won\'t delete if a non-existent user is passed via mutation' do
      expect(User.count).to eq(1)
      post '/graphql', params: { query: sad_path_mutation }

      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a Hash
      expect(parsed_response).to have_key :data
      expect(parsed_response[:data]).to be_a Hash
      expect(parsed_response[:data]).to have_key :deleteUser
      expect(parsed_response[:data][:deleteUser]).to be_a Hash
      expect(parsed_response[:data][:deleteUser]).to have_key :id
      expect(parsed_response[:data][:deleteUser][:id]).not_to eq("#{@user.id}")
      expect(parsed_response[:data][:deleteUser]).to have_key :errors
      expect(parsed_response[:data][:deleteUser][:errors]).to be_an Array
      expect(parsed_response[:data][:deleteUser][:errors][0]).to be_a String
      expect(parsed_response[:data][:deleteUser][:errors][0]).to eq('User does not exist')
      expect(User.count).to eq(1)
    end
  end

  def happy_path_mutation
    <<~GQL
      mutation {
        deleteUser(input :{
         id: "#{@user.id}",
        }) {
          id
          errors
        }
      }
    GQL
  end

  def sad_path_mutation
    <<~GQL
      mutation {
        deleteUser(input :{
         id: "999",
        }) {
          id
          errors
        }
      }
    GQL
  end
end
