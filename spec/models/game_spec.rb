require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should have_many :user_games }
    it { should have_many(:users).through(:user_games) }
  end

  describe 'validations' do
    it { should validate_presence_of :board_game_atlas_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :min_players }
    it { should validate_presence_of :max_players }
    it { should validate_presence_of :min_playtime }
    it { should validate_presence_of :max_playtime }
    it { should validate_presence_of :min_age }
    it { should validate_presence_of :year_published }
    it { should validate_presence_of :description }
    it { should validate_presence_of :thumb_url }
    it { should validate_presence_of :image_url }
    it { should validate_presence_of :url }
  end
end
