class Mutations::Users::UserGames < Mutations::BaseMutation
  argument :id, required: true

  # type Types::UserType

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(username:)
    new_user = User.new(
      username: username
    )
    if new_user.save
      { 
        user: new_user,
        errors: []
      }
    else 
      {
        user: nil,
        errors: new_user.errors.full_messages
      }
    end
  end
end