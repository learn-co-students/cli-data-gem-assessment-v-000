class WineUnder20::Wine
  attr_accessor :name, :price, :description


#move this to a scraper class
  def self.scrape_wines
    wines = []
    @doc = Nokogiri::HTML(open("https://www.binnys.com/wine//1/72#"))
    @doc.search("div.row.result").each do |wine_div|
      wine = WineUnder20::Wine.new
      # wine.url = wine_div.search().attr("href")
      wine.name = wine_div.search("h3.title").text.strip
      wine.price = wine_div.search("div.prodPrice.unitPrice.salePrice").text.sub /\s*\(.+\)$/, ''.strip
      wine.description = wine_div.search("div.shortReview.hawkLink").text.strip

      wines << wine
    end
    binding.pry
    wines

  end

end
