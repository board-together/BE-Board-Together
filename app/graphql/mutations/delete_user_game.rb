class Mutations::DeleteUserGame < Mutations::BaseMutation
  argument :id, ID, required: true

  field :errors, [String], null: true
  field :id, ID, null: true
  # type Types::UserGameType

  def resolve(id:)
    user_game = UserGame.find_by(id: id)
    return { errors: ['User does not exist'], id: nil } if user_game.nil?

    user_game.destroy
    { errors: [], id: user_game.id }
  end
end
