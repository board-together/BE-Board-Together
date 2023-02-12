class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::CreateUser
  field :create_user_game, mutation: Mutations::CreateUserGame
  field :delete_user, mutation: Mutations::DeleteUser
  field :delete_user_game, mutation: Mutations::DeleteUserGame
end
