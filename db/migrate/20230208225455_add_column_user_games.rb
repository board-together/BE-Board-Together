class AddColumnUserGames < ActiveRecord::Migration[5.2]
  def change
    add_column :user_games, :borrower_id, :integer

  end
end
