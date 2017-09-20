class AmazonTool::Category

  attr_accessor :name, :products, :price, :all

  @products = []

  def initialize()

  end

  def scrape_price(item)

    case item.category.name

    when "Toys & Games"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/"))
      prices = pricing.search('span.p13n-sc-price')
      if item.index == 0
        return prices[0].text
      elsif item.index == 1
        return prices[1].text
      elsif item.index == 2
        return prices[2].text
      elsif item.index == 3
        return prices[3].text
      elsif item.index == 4
        return prices[4].text
      elsif item.index == 5
        return prices[5].text
      end

    when "Electronics"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Electronics/zgbs/electronics/"))
      prices = pricing.search('span.p13n-sc-price')
      if item.index == 0
        return prices[0].text
      elsif item.index == 1
        return prices[1].text
      elsif item.index == 2
        return prices[2].text
      end

    when "Camera & Photo"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-camera-photo/zgbs/photo/"))
      prices = pricing.search('span.p13n-sc-price')
      if item.index == 0
        return prices[0].text
      elsif item.index == 1
        return prices[1].text
      elsif item.index == 2
        return prices[2].text
      end

    when "Video Games"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-video-games/zgbs/videogames/"))
      prices = pricing.search('span.p13n-sc-price')
      if item.index == 0
        return prices[0].text
      elsif item.index == 1
        return prices[1].text
      elsif item.index == 2
        return prices[2].text
      end

    when "Books"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/best-sellers-books-Amazon/zgbs/books/"))
      prices = pricing.search('span.p13n-sc-price')
      if item.index == 0
        return prices[0].text
      elsif item.index == 1
        return prices[1].text
      elsif item.index == 2
        return prices[2].text
      end

    when "Clothing, Shoes & Jewelry"
      pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers/zgbs/fashion/"))
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

end
