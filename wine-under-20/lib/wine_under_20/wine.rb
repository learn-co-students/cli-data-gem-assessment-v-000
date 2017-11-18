class WineUnder20::Wine
  attr_accessor :name, :price, :url, :description


#move this to a scraper class
  def scrape_wines
    @doc = Nokogiri::HTML(open("http://www.binnys.com/wine"))
    @doc.search("div.row.result").collect do |wine_div|
      wine = WineUnder20::Wine.new
      wine.url = wine_div.search
      wine.name = wine_div.search
      wine.price = wine_div.search
      wine.description = wine_div.search
    end

  end

  def self.scrape_wine_site
    wine = self.new

    #binding.pry
# @doc.search each do |wine|
#name =
#price =

#end
    wine.name = doc.css("h3.title").text
    wine.price = doc.css("div.prodPrice.unitPrice.salePrice").text
    wine
  #  binding.pry
  #  name =
  #  price =
  #  url =
    #zip_code
  end

end
