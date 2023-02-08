require "rails_helper"

RSpec.describe Mutations::CreateUser, type: :request do
  describe "create a user" do
    it "can create a user from a mutation" do

      post '/graphql', params: { query: mutation }
      json = JSON.parse(response.body)
      
      binding.pry
      result = json['data']['createUser']
      expected_result = {
                          "data": {
                              "createUser": {
                                  "id": 1,
                                  "username": "Floofything"
                              },
                              "errors": []
                          }
                        }
      expect(result).to eq(expected_result)
    end
  end
  
  def mutation
    <<~GQL
      mutation {
      createUser(input:{username: "Floofything"}) {
        user {
              username
            }
          errors
          }
      }
    GQL
  end
end

