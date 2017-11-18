class WineUnder20::Wine
  attr_accessor :name, :price, :url, :description


#move this to a scraper class
  def scrape_wines
    @doc = Nokogiri::HTML(open("http://www.binnys.com/wine"))
    @doc.search("div.row.result").collect do |wine_div|
      wine = WineUnder20::Wine.new
      wine.url = wine_div.search().attr("href")
      wine.name = wine_div.search("h3.title").text
      wine.price = wine_div.search("div.prodPrice.unitPrice.salePrice").text
      wine.description = wine_div.search("div.shortreview").text

      wine.save
    end

  end

end
