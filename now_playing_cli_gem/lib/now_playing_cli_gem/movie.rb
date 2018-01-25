class NowPlayingCliGem::Movie
  attr_accessor :name, :summary, :stars

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

# Returning scraped data of the movies
  def self.all
    @@all ||= scrape_now_playing
  end

  def self.find(id)
    self.all[id-1]
  end

# Scraping summary data
  def summary
    doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
    summary = doc.search("div[itemprop='description']").text.strip
  end

# Scraping stars data
  def stars
    doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
    stars = doc.search("span[itemprop='actors'] span[itemprop='name']").collect{|e| e.text.strip}.join(", ")
  end

# Scraping name data
  private
    def self.scrape_now_playing
      doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
      names = doc.search("h4[itemprop='name'] a[itemprop='url']")
      names.collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    end
  end
