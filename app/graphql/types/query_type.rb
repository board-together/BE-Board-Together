module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false

    field :user, Types::UserType, null: false do
      argument :username, String, required: true
    end

    field :search_games, [Types::GameType], null: false do
      argument :name, String, required: true
    end

    def users
      User.all
    end

    def user(username:)
      User.find_by(username: username)
    end

    def search_games(name:)
      GameFacade.new.search(name)
    end
  end
end
