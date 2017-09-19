class AmazonTool::Products

  attr_accessor :name, :price, :availability, :url

  def self.scrape_products
    @@items = {}
    products = []
    doc = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers/zgbs"))
    categories = doc.search('.zg_homeWidget')
      categories.each do |category|

        new_category = AmazonTool::Category.new
        new_category.name = category.search('h3').text
        products = category.search('.zg_item.zg_homeWidgetItem')

        @@items[new_category.name] = []

          products.each do |product|
            new_item = AmazonTool::Items.new
            new_item.category = new_category
            url = "http://www.amazon.com#{product.search('a.a-link-normal').attr('href').text}"
            new_item.url = url
            name_and_rating = product.search('a.a-link-normal').text.split("\n")
            new_item.name = name_and_rating[0]
            @@items[new_category.name] << new_item
          end
      end
   @@items
  end

  def self.toys_and_games
    scrape_products
      @@items["Toys & Games"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end

  def self.electronics
    scrape_products
      @@items["Electronics"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end

  def self.camera_and_photo
    scrape_products
      @@items["Camera & Photo"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end

  def self.video_games
    scrape_products
      @@items["Video Games"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end

  def self.books
    scrape_products
      @@items["Books"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end

  def self.clothing_shoes_and_jewelry
    scrape_products
      @@items["Clothing, Shoes & Jewelry"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name}"
      end
  end


end
