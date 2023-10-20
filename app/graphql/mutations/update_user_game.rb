class Mutations::UpdateUserGame < Mutations::BaseMutation
  argument :borrower_id, Integer, required: :nullable
  argument :id, Integer, required: true
  argument :status, Integer, required: true

  field :errors, [String], null: false
  field :user_game, Types::UserGameType, null: false

  def resolve(id:, borrower_id:, status:)
    find_user_game = UserGame.find_by(id: id)

    if find_user_game.nil?
      {
        user_game: nil,
        errors: []
      }
    else
      find_user_game.update(borrower_id: borrower_id, status: status)
      updated_user_game = UserGame.find_by(id: id)

      {
        user_game: {
          id: id,
          borrower_id: borrower_id,
          status: UserGame.statuses[updated_user_game.status]
        },
        errors: []
      }
    end
  end
end
