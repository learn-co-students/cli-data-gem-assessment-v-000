class AmazonTool::Products

  attr_accessor :name, :price, :availability, :url


  def self.scrape_products
    products = []
    doc = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers/zgbs"))
    categories = doc.search('.zg_homeWidget')
      categories.each do |category|
        new_category = AmazonTool::Category.new
        new_category.name = category.search('h3').text
        products = category.search('.zg_item.zg_homeWidgetItem')
          products.each do |product|
            new_item = AmazonTool::Items.new
            name = product.search('.data-p13n-asin-metadata a').text
            url = product.search('.data-p13n-asin-metadata a href')
            new_item.name = name
            new_item.category = new_category
            new_item.price = "$27.999999"
            binding.pry
          end
      end

    #GO TO Amazon
    #GO TO category
    #Scrape Bestsellers + Info
    #INSTANTIATE A Product
    products
  end

  def self.toys_and_games
    #Array Location - 0
    product_1 = self.new
    product_1.name = "WowWee Fingerlings Mia Purple Baby Monkey with Bonus Stand"
    product_1.price = "$7"
    product_1.availability = true
    product_1.url = 'www.amazon.com'

    product_2 = self.new
    product_2.name = "WowWee Fingerlings Mia Turqouise Baby Monkey with Bonus Stand"
    product_2.price = "$7.50"
    product_2.availability = true
    product_2.url = 'www.amazon.com'

    return [product_1, product_2]
  end

  def self.electronics
    #Array Location - 1
  end

  def self.camera_and_photo
    #Array Location - 2

  end

  def self.video_games
    #Array Location - 3
  end

  def self.books
    #Array Location - 4
  end

  def self.clothing_shoes_and_jewelry
    #Array Location - 5
  end


end
