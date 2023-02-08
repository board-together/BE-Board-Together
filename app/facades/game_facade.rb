class GameFacade
  def search(game)
    search_results = service.search(game)[:games]

    search_results.map do |game_hash|
      BoardGame.new(game_hash)
    end
  end

  def service
    GameService.new
  end
end
