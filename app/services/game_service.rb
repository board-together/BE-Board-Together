class GameService
  def search(game)
    get_url("/api/search", { name: game })
  end

  def get_url(url, params = nil)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.boardgameatlas.com") do |faraday|
      faraday.params['client_id'] = ENV.fetch('client_id')
    end
  end
end
