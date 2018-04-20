class TopGames::Game
  
 def self.ranking
  #scrape pcgamer
  @games = TopGames::Scrape.scrape_games
  @summary = TopGames::Scrape.scrape_summary
  end 
  
 
  
end 