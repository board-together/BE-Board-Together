require 'rails_helper'

describe Mutations::DeleteUser, type: :request do
  let!(:user) { create(:user) }
  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  context 'happy path' do
    it 'deletes a user via mutation' do
      post '/graphql', params: { query: mutation(user.id) }

      expect(response).to be_successful
      expect(parsed_response.dig(:data, :deleteUser, :id)).to eq(user.id.to_s)
      expect { User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'sad path' do
    it 'does not delete when a non-existent user is passed via mutation' do
      non_existent_id = User.maximum(:id).next
      post '/graphql', params: { query: mutation(non_existent_id) }

      expect(response).to be_successful
      expect(parsed_response.dig(:data, :deleteUser, :id)).to be_nil
      expect(parsed_response.dig(:data, :deleteUser, :errors)).to eq(['User does not exist'])
    end
  end

  def mutation(id)
    <<~GQL
      mutation {
        deleteUser(input :{
         id: "#{id}",
        }) {
          id
          errors
        }
      }
    GQL
  end
end
