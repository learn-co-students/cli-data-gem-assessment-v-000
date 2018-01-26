class NowPlayingCliGem::Movie
  attr_accessor :name, :link

  def initialize(name = nil, link = nil, url = nil)
    @name = name
    @link = link
    @url = url
  end

# Returning scraped data of the movies piece by piece
  def self.all
    @@all ||= name
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

    def self.link
      doc = Nokogiri::HTML(open('http://www.imdb.com/movies-in-theaters/'))
      link = doc.search("a[itemprop='url']").collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    end
  end

#PROGRAM IS WORKING AND COMPLETE
