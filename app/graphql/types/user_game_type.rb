# frozen_string_literal: true

module Types
  class UserGameType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :game_id, Integer
    field :id, ID, null: false
    field :status, Integer
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer
  end
end
