class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::CreateUser
  field :create_user_game, mutation: Mutations::CreateUserGame
  field :update_user_game, mutation: Mutations::UpdateUserGame
end
