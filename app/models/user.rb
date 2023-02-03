class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games

  validates_presence_of :name
  validates :email, uniqueness: true
end
