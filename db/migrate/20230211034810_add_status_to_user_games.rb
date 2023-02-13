class AddStatusToUserGames < ActiveRecord::Migration[5.2]
  def change
    add_column :user_games, :status, :integer, default: 0
  end
end
