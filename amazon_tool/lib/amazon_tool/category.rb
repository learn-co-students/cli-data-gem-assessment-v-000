class AmazonTool::Category

  attr_accessor :name, :products, :price, :all

  @products = []

  def initialize()

  end

  def scrape_price(item)
    pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/"))
    prices = pricing.search('span.p13n-sc-price')

    binding.pry

    if item.index == 0
      item.price == prices[0].text
    elsif item.index == 1
      item.price == prices[1].text
    elsif item.index == 2
      item.price == prices[2].text
    end
  end

end
