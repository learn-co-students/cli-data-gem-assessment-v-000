class NowPlayingCliGem::Movie
  attr_accessor :title, :details, :length

  def self.today
    # Returning scraped data of the movies
    self.scrape_movies
  end

  def self.scrape_movies
    movies []

    movies << self.scrape_mazerunner
    movies << self.scrape_hostiles

    movies
  end

  def self.scrape_mazerunner
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt4500922/?ref_=inth_ov_tt"))

    movie = self.new
    movie.title = doc.search("h1.name").text.strip
    movie.details = doc.search("div[itemprop='description']").text.strip
    movie.length = doc.search("subtext.duration").text.strip
    movie
  end

  def self.scrape_hostiles
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt5478478/?ref_=inth_ov_tt"))

    movie = self.new
    movie.title = doc.search("h1.name").text.strip
    movie.details = doc.search("plot_summary.summary_text").text.strip
    movie.length = doc.search("subtext.duration").text.strip
    movie
  end

end
