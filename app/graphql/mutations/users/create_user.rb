class Mutations::Users::CreateUser < Mutations::BaseMutation
  argument :username, required: true

  # type Types::UserType

  field :errors, [String], null: false
  field :user, Types::UserType, null: false

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
