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
        expect(board_game.board_game_atlas_id).not_to be_nil
        expect(board_game.name).not_to be_nil
        expect(board_game.url).not_to be_nil
        expect(board_game.year_published).not_to be_nil
        expect(board_game.min_players).not_to be_nil
        expect(board_game.max_players).not_to be_nil
        expect(board_game.min_playtime).not_to be_nil
        expect(board_game.max_playtime).not_to be_nil
        expect(board_game.description).not_to be_nil
        expect(board_game.thumb_url).not_to be_nil
        expect(board_game.image_url).not_to be_nil
      end
    end
  end
end
