class Types::UserType < Types::BaseObject
  field :borrowed_games, [Types::UserGameType], null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :games, [Types::GameType], null: true
  field :id, ID, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :user_games, [Types::UserGameType], null: true
  field :username, String, null: false

  delegate :games, to: :object
  delegate :user_games, to: :object

  def borrowed_games
    UserGame.where(borrower_id: object.id)
  end
end
