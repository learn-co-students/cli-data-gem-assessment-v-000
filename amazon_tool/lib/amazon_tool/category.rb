class AmazonTool::Category

  attr_accessor :name, :products, :price, :all

  @products = []

  def initialize()

  end

  def scrape_price(item)
    pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/"))
    prices = pricing.search('span.p13n-sc-price')
    if prices[0].text
    prices[1].text
    prices[2].text
  end

end
