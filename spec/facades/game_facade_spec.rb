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
      end
    end
  end
end