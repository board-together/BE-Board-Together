require 'rails_helper'

describe 'GameService' do
  describe '#search' do
    describe 'happy path' do
      it 'returns a list of search results', :vcr do
        game = 'catan'

        search_results = GameService.new.search(game)

        expect(search_results).to be_a Hash
        expect(search_results).to have_key(:games)

        expect(search_results[:count]).to be_an Integer

        expect(search_results[:games]).to be_an Array

        search_results[:games].each do |game_hash|
          expect(game_hash).to be_a Hash
          expect(game_hash).to have_key :id
          expect(game_hash).to have_key :handle
          expect(game_hash).to have_key :min_players
          expect(game_hash).to have_key :max_players
          expect(game_hash).to have_key :min_playtime
          expect(game_hash).to have_key :max_playtime
          expect(game_hash).to have_key :min_age
          expect(game_hash).to have_key :year_published
          expect(game_hash).to have_key :description
          expect(game_hash).to have_key :thumb_url
          expect(game_hash).to have_key :image_url
          expect(game_hash).to have_key :url
        end
      end
    end
  end
end