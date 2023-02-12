class UpdateColumnUserGames < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_games, :status, default: 0
  end
end
