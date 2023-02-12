class Mutations::DeleteUser < Mutations::BaseMutation
  # when a mutation is POSTed an :id argument is required
  argument :id, ID, required: true

  field :errors, [String], null: true
  field :id, ID, null: true

  def resolve(id:)
    if User.exists?(id)
      User.destroy(id)
      {
        id: id,
        errors: []
      }
    else
      {
        id: nil,
        errors: ['User does not exist']
      }
    end
  end
end
