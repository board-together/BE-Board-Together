require 'rails_helper'

describe 'BoardGame' do
  describe '#initialize' do
    it 'exists, with attributes' do
      attributes = {
        id: 'foo_string',
        name: 'catan',
        url: 'foo_url',
        year_published: 1999,
        min_players: 1,
        max_players: 2,
        min_age: 2,
        min_playtime: 10,
        max_playtime: 30,
        description: 'lots of foo text',
        image_url: 'foo image url',
        thumb_url: 'foo thumb url'
      }

      board_game = BoardGame.new(attributes)

      expect(board_game).to be_a BoardGame
      expect(board_game.board_game_atlas_id).to eq('foo_string')
      expect(board_game.name).to eq('catan')
      expect(board_game.year_published).to eq(1999)
      expect(board_game.min_players).to eq(1)
      expect(board_game.max_players).to eq(2)
      expect(board_game.min_age).to eq(2)
      expect(board_game.min_playtime).to eq(10)
      expect(board_game.max_playtime).to eq(30)
      expect(board_game.description).to eq('lots of foo text')
      expect(board_game.image_url).to eq('foo image url')
      expect(board_game.thumb_url).to eq('foo thumb url')
    end
  end
end
