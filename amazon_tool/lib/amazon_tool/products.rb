class AmazonTool::Products

  attr_accessor :name, :price, :availability, :url


  def self.scrape_products
    products = []
    doc = Nokogiri::HTML(open(https://www.amazon.com/Best-Sellers/zgbs))
    #GO TO Amazon
    #GO TO category
    #Scrape Bestsellers + Info
    #INSTANTIATE A Product
    products

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
