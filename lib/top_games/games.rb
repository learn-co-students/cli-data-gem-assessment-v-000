class TopGames::Game
  

  
  def self.ranking
  #scrape ign 
  @games = TopGames::Scrape.scrape_games
  end 
  
 
  
end 