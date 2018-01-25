#class NowPlayingCliGem::Movie
#  attr_accessor :name, :summary, :stars
#
#  def initialize(name = nil, url = nil) #, summary = nil, stars = nil)
#    @name = name
#    @url = url
## Maybe the below code needs to be included?
##   @summary = summary
##   @stars = stars
##   @@all << self
#  end
#
## Returning scraped data of the movies
#  def self.all
#    @@all ||= scrape_now_playing
#  end
#
#  def self.find(id)
#    self.all[id-1]
#  end
#
#  def self.find_by_name(name)
#    self.all.detect do |m|
#      m.name.downcase.strip == name.downcase.strip ||
#      m.name.split("(").first.strip.downcase == name.downcase.strip
#    end
#  end
#
#  def summary
#    @summary ||= plot_summary_doc.search("div[itemprop='description']").text.strip
#  end
#
#  def stars
#    @stars ||= doc.search("span[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")
#  end
#
## Scraping data
#  private
#    def self.scrape_now_playing
#      doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
#      names = doc.search("h4[itemprop='name'] a[itemprop='url']")
#      names.collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
#    end
#
#    def plot_summary_doc
#      @plot_summary_doc ||= Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
#    end
#
#    def doc
#      @doc ||= Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
#    end
#  end




class NowPlayingCliGem::Movie
  attr_accessor :name, :summary, :stars

  # Returning scraped data of the movies
  def self
    self.scrape_movies
  end

  # Creating arrays of scraped data
  def self.scrape_movies
    movies []

    movies << self.scrape_mazerunner
    movies << self.scrape_hostiles

    movies
  end

  # Scraping data for Maze Runner movie
  def self.scrape_mazerunner
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt4500922/?ref_=inth_ov_tt")

    movie = self.new
    movie.name = doc.search("h1[itemprop='name']").text.strip
    movie.summary = doc.search("div[itemprop='description']").text.strip
    movie.stars = doc.search("span[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")

    movie
  end

  # Scraping data for Hostiles movie
  def self.scrape_hostiles
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt5478478/?ref_=inth_ov_tt"))

    movie = self.new
    movie.name = doc.search("h1[itemprop='name']").text.strip
    movie.summary = doc.search("div[itemprop='description']").text.strip
    movie.stars = doc.search("span[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")

    movie
  end

end
