class BoardGame
  attr_reader :id,
              :handle,
              :url,
              :year_published,
              :min_players,
              :max_players,
              :min_age,
              :min_playtime,
              :max_playtime,
              :description,
              :image_url,
              :thumb_url

  def initialize(data)
    @id = data[:id]
    @handle = data[:handle]
    @url = data[:url]
    @year_published = data[:year_published]
    @min_players = data[:min_players]
    @max_players = data[:max_players]
    @min_age = data[:min_age]
    @min_playtime = data[:min_playtime]
    @max_playtime = data[:max_playtime]
    @description = data[:description]
    @image_url = data[:image_url]
    @thumb_url = data[:thumb_url]
  end
end
