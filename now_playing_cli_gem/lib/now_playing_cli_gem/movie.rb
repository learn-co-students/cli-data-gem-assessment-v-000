class NowPlayingCliGem::Movie

  attr_accessor :title, :details, :stars, :url

  def self.today
    # Returning scraped data of the movies
    self.scrape_movies
  end

  def self.scrape_movies
    movies []

    

    movies
  end

end
