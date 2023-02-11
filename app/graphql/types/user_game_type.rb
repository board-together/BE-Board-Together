class Types::UserGameType < Types::BaseObject
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :game_id, Integer
  field :id, ID, null: false
  field :status, Integer
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :user_id, Integer
  field :game, Types::GameType, null: true
  field :borrower_id, Integer, null: true
  field :borrowed_games, [Types::GameType], null: false
  field :owned_games, [Types::GameType], null: false

  delegate :game, to: :object
  delegate :status, to: :object

  # def borrowed_games
  #   UserGame.where(borrower_id: object.id).map do |user_game|
  #     OpenStruct.new(game: user_game.game, status: user_game.status)
  #   end
  # end

  # def owned_games
  #   UserGame.where(user_id: object.id).map do |user_game|
  #     user_game.game  user_game.status
  #   end
  # end

#   def borrowed_games
#   UserGame.where(borrower_id: object.id).map do |user_game|
#     { game: game, status: user_game.status }
#   end
# end

  # def owned_games
  #   UserGame.where(borrower_id: object.id).map(&:game, &:status)
  # end
end
