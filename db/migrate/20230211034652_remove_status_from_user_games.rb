class RemoveStatusFromUserGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_games, :status, :integer
  end
end
