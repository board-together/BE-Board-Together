require 'rails_helper'

RSpec.describe UserGame, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :game }
  end

  describe 'validations' do
    it { should validate_presence_of :status }
    it { should validate_presence_of(:borrower_id).allow_nil}
  end
end
