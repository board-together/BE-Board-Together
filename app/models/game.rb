class Game < ApplicationRecord
  before_create :set_default_image_url, :set_default_thumb_url, :set_default_description
  has_many :user_games
  has_many :users, through: :user_games

  validates :board_game_atlas_id, :name, :min_players, :max_players, :min_playtime, :max_playtime, :min_age, :thumb_url, :image_url,
            :year_published, :description, :url, presence: { allow_blank: true }

  private 
  def set_default_image_url
    self.image_url = "https://variety.com/wp-content/uploads/2021/07/Rick-Astley-Never-Gonna-Give-You-Up.png?w=1000&h=563&crop=1" if image_url.blank?
  end 
  def set_default_thumb_url
    self.image_url = "https://variety.com/wp-content/uploads/2021/07/Rick-Astley-Never-Gonna-Give-You-Up.png?w=1000&h=563&crop=1" if thumb_url.blank?
  end 
  def set_default_description
    self.image_url = "Never Gonna Give You Up" if description.blank?
  end 
end
