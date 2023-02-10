class Types::UserType < Types::BaseObject
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :games, [Types::GameType], null: true
  field :user_games, [Types::UserGameType], null: true
  field :id, ID, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :username, String, null: false

  delegate :games, to: :object
  delegate :user_games, to: :object
end
