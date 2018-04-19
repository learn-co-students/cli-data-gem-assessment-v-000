class TopGames::Game
  
 def self.ranking
  #scrape pcgamer
  @games = TopGames::Scrape.scrape_games
  end 
  
 
  
end 