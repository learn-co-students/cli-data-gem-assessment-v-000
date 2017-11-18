class WineUnder20::Wine
<<<<<<< HEAD
  attr_accessor :name, :price
=======
  attr_accessor :name, :price, :url
>>>>>>> 7e52c4464d65f0a0fb5a728fea59233b3561aee1

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
<<<<<<< HEAD
    wine = self.new
    doc = Nokogiri::HTML(open("http://www.binnys.com/wine"))
    #binding.pry
# @doc.search each do |wine|

#name =
#price =

#end

    wine.name = doc.css("h3.title").text
    wine.price = doc.css("div.prodPrice.unitPrice.salePrice").text
    wine
=======
    doc = Nokogiri::HTML(open(insertsitehere))
    binding.pry
    name =
    price =
    url =
    #zip_code
  end
>>>>>>> 7e52c4464d65f0a0fb5a728fea59233b3561aee1
  end

end
