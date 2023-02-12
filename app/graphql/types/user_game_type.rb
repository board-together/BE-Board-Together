class Types::UserGameType < Types::BaseObject
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :game_id, Integer
  field :id, ID, null: false
  field :status, Integer, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :user_id, Integer
  field :game, Types::GameType, null: true
  field :borrower_id, Integer, null: true

  delegate :user, to: :object
  delegate :game, to: :object

end
