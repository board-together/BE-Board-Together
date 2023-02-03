class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :board_game_atlas_id
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.integer :min_age
      t.integer :year_published
      t.string :description
      t.string :thumb_url
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
