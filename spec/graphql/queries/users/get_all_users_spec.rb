require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query all users' do
      create_list(:user, 10)

      result = BoardTogetherSchema.execute(query).as_json
      expect(result['data']['users'].count).to eq(10)
    end
  end

  def query
    <<~GQL
      {
        users {
          id
          username
        }
      }
    GQL
  end
end
