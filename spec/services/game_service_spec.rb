require 'rails_helper'

describe 'GameService' do
  describe '#search' do
    describe 'happy path' do
      it 'returns a list of search results' do
        game = 'Catan'

        search_results = GameService.new.search(game)
      end
    end

    describe 'sad path' do
      # code here
    end
  end
end