class GameFacade
  def search(game)
    search_results = game_service.search(game)[:games]

    search_results.map do |game_hash|
      BoardGame.new(game_hash)
    end
  end

  private

  def game_service
    @game_service ||= GameService.new
  end
end
