class Mutations::DeleteUser < Mutations::BaseMutation
  # when a mutation is POSTed an :id argument is required
  argument :id, ID, required: true

  field :errors, [String], null: true
  field :user, Types::UserType, null: true

  def resolve(id:)
    user = User.find_by(id: id)

    return { errors: [], id: nil } if user.nil?

    user.destroy
    { errors: [], id: user.id }
  end
end
