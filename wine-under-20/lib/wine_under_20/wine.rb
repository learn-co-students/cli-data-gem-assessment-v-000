class WineUnder20::Wine
  attr_accessor :name, :price, :url

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
    doc = Nokogiri::HTML(open(insertsitehere))
    binding.pry
    name =
    price =
    url =
    #zip_code
  end
  end

end
