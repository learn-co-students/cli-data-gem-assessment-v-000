#class NowPlayingCliGem::Movie
#  attr_accessor :title, :details, :length
#
## Returning scraped data of the movies
#  def self
#    self.scrape_movies
#  end
#
## Creating arrays of scraped data
#  def self.scrape_movies
#    movies []
#
#    movies << self.scrape_mazerunner
#    movies << self.scrape_hostiles
#
#    movies
#  end
#
## Scraping data for Maze Runner movie
#  def self.scrape_mazerunner
#    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt4500922/?ref_=inth_ov_tt"))
#
#    movie = self.new
#    movie.title = doc.search("div.title_wrapper h1").text.strip
#    movie.details = doc.search("div.summary_text").text.strip
#    movie.length = doc.search("div.subtext time").text.strip
#    movie
#  end
#
## Scraping data for Hostiles movie
#  def self.scrape_hostiles
#    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt5478478/?ref_=inth_ov_tt"))
#
#    movie = self.new
#    movie.title = doc.search("div.title_wrapper h1").text.strip
#    movie.details = doc.search("div.summary_text").text.strip
#    movie.length = doc.search("div.subtext time").text.strip
#    movie
#  end
#
#end
