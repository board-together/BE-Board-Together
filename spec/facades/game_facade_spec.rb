require 'rails_helper'

describe 'GameFacade' do
  describe '#games' do
    it 'returns an Array of BoardGame objects', :vcr do
      game = 'catan'

      search_results = GameFacade.new.search(game)

      expect(search_results).to be_an Array
      expect(search_results.count).to be > 0

      search_results.each do |board_game|
        expect(board_game).to be_a BoardGame
        expect(board_game.board_game_atlas_id).to_not be(nil)
        expect(board_game.name).to_not be(nil)
        expect(board_game.url).to_not be(nil)
        expect(board_game.year_published).to_not be(nil)
        expect(board_game.min_players).to_not be(nil)
        expect(board_game.max_players).to_not be(nil)
        expect(board_game.min_playtime).to_not be(nil)
        expect(board_game.max_playtime).to_not be(nil)
        expect(board_game.description).to_not be(nil)
        expect(board_game.thumb_url).to_not be(nil)
        expect(board_game.image_url).to_not be(nil)
      end
    end
  end
end
