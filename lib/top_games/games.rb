class TopGames::Game
  
  attr_accessor :name, :developer, :release_date, :url, :summary
  
  def self.ranking
    #will return the instances of games 
    puts "YOU WILL SCRAPE AND MAKE PROGRESS"
    
    game_1 = self.new 
    game_1.name = "Chrono Trigger"
    game_1.developer = "Square"
    game_1.release_date = "1995"
    game_1.url = "http://www.ign.com/lists/top-100-rpgs/1/1/3"
    game_1.summary = "blah blah blah"
    
    game_2 = self.new 
    game_2.name = "Final Fantasy VI"
    game_2.developer = "Square"
    game_2.release_date = "1994"
    game_2.url = "http://www.ign.com/lists/top-100-rpgs/1/1/3"
    game_2.summary = "blah blah blah"
    
    game_3 = self.new 
    game_3.name = "Final Fantasy VI"
    game_3.developer = "Square"
    game_3.release_date = "1994"
    game_3.url = "http://www.ign.com/lists/top-100-rpgs/1/1/3"
    game_3.summary = "blah blah blah"
    
    [game_1, game_2, game_3]
  end 
  
end 