module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :search_games, [Types::GameType], null: false do
      argument :name, String, required: true
      # argument :client_id, String, required: true
    end
    field :user, Types::UserType, null: false do
      argument :username, String, required: true
    end
    field :users, [Types::UserType], null: false

    # field methods
    def users
      User.all
    end

    def user(username:)
      User.find_by(username: username)
    end

    def search_games(name:, client_id:)
      GameFacade.new.search(name)
      # GameFacade.new.search(name: name, client_id: client_id)
    end
  end
end
