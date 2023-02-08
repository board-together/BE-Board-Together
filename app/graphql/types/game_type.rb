class Types::GameType < Types::BaseObject
  field :board_game_atlas_id, String
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :description, String
  field :id, ID, null: false
  field :image_url, String
  field :max_players, Integer
  field :max_playtime, Integer
  field :min_age, Integer
  field :min_players, Integer
  field :min_playtime, Integer
  field :name, String
  field :thumb_url, String
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  field :url, String
  field :year_published, Integer
end
