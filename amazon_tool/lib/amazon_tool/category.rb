class AmazonTool::Category

  attr_accessor :name, :products, :price, :all

  @products = []

  def initialize()

  end

  def scrape_price(item)
    pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/"))
    prices = pricing.search('span.p13n-sc-price')
    if item.index == 0
      return prices[0].text
    elsif item.index == 1
      return prices[1].text
    elsif item.index == 2
      return prices[2].text
    end
  end

end
