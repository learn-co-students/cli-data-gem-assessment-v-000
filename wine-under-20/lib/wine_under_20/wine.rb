class WineUnder20::Wine
  attr_accessor :name, :price

  def self.today
    self.scrape_wines
  end

  def self.scrape_wines
    wines = []

    wines << self.scrape_wine_site
    #Go to wine website, find the products.
    #extract the properties
    #instantiate a wine
    # create an array of wines based on zip code
    wines
  end

  def self.scrape_wine_site
    wine = self.new
    doc = Nokogiri::HTML(open("http://www.binnys.com/wine"))
    #binding.pry
    wine.name = doc.css("h3.title").text
    wine.price = doc.css("div.prodPrice.unitPrice.salePrice").text
    wine
  end

end
