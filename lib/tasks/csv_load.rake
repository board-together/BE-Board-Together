require 'csv'

namespace :csv_load do
	task games: :environment do
		CSV.foreach('./db/data/games.csv', headers: true) do |row|
			data = row.to_hash
			name_url = data["Name"].downcase.gsub(" ", "-")
			Game.create!(
				board_game_atlas_id: data["BGGId"], 
				name: data["Name"], min_players: data["MinPlayers"].to_i, 
				max_players: data["MaxPlayers"].to_i, 
				min_playtime: data["ComMinPlaytime"].to_i, 
				max_playtime: data["ComMaxPlaytime"].to_i, 
				min_age: data["ComAgeRec"].to_i, 
				year_published: data["YearPublished"].to_i, 
				description: data["Description"], 
				thumb_url: data["ImagePath"],
				image_url: data["ImagePath"],
				url: "https://boardgamegeek.com/boardgame/#{data["BBGId"]}/#{name_url}"
			)
		end
		ActiveRecord::Base.connection.reset_pk_sequence!('games')
	end
end

