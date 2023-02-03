require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_games }
    it { should have_many(:games).through(:user_games) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :name}
  end
end
