# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :board_game_atlas_id, String
    field :name, String
    field :min_players, Integer
    field :max_players, Integer
    field :min_playtime, Integer
    field :max_playtime, Integer
    field :min_age, Integer
    field :year_published, Integer
    field :description, String
    field :thumb_url, String
    field :image_url, String
    field :url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
