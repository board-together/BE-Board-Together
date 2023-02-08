module Mutations
  class CreateUser < BaseMutation
    argument :id, ID, required: true
    argument :username, required: true

    type Types::UserType

    def resolve(id:, username:)
      User.create!(
        id: id,
        username: username
      )
    end
  end
end