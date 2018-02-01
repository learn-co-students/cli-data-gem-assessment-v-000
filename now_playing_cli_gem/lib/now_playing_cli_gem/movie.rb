class NowPlayingCliGem::Movie

# Automatically sets up getter and setter methods for the instance variables
  attr_accessor :name, :link
  attr_reader :url

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end

# Instance variables - making them accessible to other outside methods
  def initialize(name = nil, link = nil, url = nil)
    @name = name
    @link = link
    @url = url
  end

# Returning scraped data of the movies piece by piece when prompted by the user
# Need help with what exactly this peiece of code does
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
      binding.pry
      link = doc.search("a[itemprop='url']").collect{|e| new(e.text.strip, "http://imdb.com#{e.attr("href").split("?").first.strip}")}
    end
end

#PROGRAM IS WORKING AND COMPLETE
