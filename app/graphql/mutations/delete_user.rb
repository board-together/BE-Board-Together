class Mutations::DeleteUser < Mutations::BaseMutation
  # when a mutation is POSTed an :id argument is required
  argument :id, ID, required: true

  field :errors, [String], null: true
  field :id, ID, null: true

  def resolve(id:)
    user = User.find_by(id: id)
    return { errors: ['User does not exist'], id: nil } if user.nil?

    user.destroy
    { errors: [], id: user.id }
  end
end
