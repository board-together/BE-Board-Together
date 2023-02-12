class Mutations::CreateUserGame < Mutations::BaseMutation
  argument :board_game_atlas_id, String, required: true
  argument :description, String, required: true
  argument :image_url, String, required: true
  argument :max_players, String, required: true
  argument :max_playtime, String, required: true
  argument :min_age, String, required: true
  argument :min_players, String, required: true
  argument :min_playtime, String, required: true
  argument :name, String, required: true
  argument :thumb_url, String, required: true
  argument :url, String, required: true
  argument :user_id, Integer, required: true
  argument :year_published, String, required: true

  field :user, Types::UserType, null: false
  field :user_games, [Types::UserGameType], null: true

  def resolve(user_id:, board_game_atlas_id:, url:, name:, year_published:, min_players:, max_players:, min_playtime:, max_playtime:, min_age:, description:, thumb_url:, image_url:)
    user = User.find(user_id)

    game = Game.find_or_create_by(board_game_atlas_id: board_game_atlas_id, url: url, name: name, year_published: year_published, min_players: min_players, max_players: max_players, min_playtime: min_playtime, max_playtime: max_playtime, min_age: min_age, description: description, thumb_url: thumb_url, image_url: image_url)

    UserGame.create!(user_id: user.id, game_id: game.id, status: 0, borrower_id: nil)
  end
end
