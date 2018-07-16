class BggTop100::Game
  attr_accessor :name, :year, :rating, :url

  def self.today
    self.scrape_games
  end

  def self.scrape_games
    games = []

    games <<self.scrape_bgg
    
#    game_1 = self.new
#    game_1.name = "Gloomhaven"
#    game_1.year = "2017"
#    game_1.rating = "8.98"
#    game_1.url = "https://boardgamegeek.com/browse/boardgame"

#    game_2 = self.new
#    game_2.name = "Pandemic Legacy: Season 1"
#    game_2.year = "2015"
#    game_2.rating = "8.66"
#    game_2.url = "https://boardgamegeek.com/browse/boardgame"

    games
  end

  def self.scrape_bgg
    doc = Nokogiri::HTML(open("https://boardgamegeek.com/browse/boardgame"))
    binding.pry
  end

end
