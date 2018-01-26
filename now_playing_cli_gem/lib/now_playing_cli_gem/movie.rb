class NowPlayingCliGem::Movie
  attr_accessor :name, :director

  def initialize(name = nil, director = nil, url = nil)
    @name = name
    @director = director
    @url = url
  end

# Returning scraped data of the movies piece by piece
  def self.all
    @@all ||= name
    @@all ||= director
  end

  def self.find(id)
    self.all[id-1]
  end

# Scraping data
  private
    def self.name
      doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
      names = doc.search("h4[itemprop='name'] a[itemprop='url']").collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    end

    def self.director
      doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
      director = doc.search("span[itemprop='director'] a[itemprop='url']").collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    end
  end
