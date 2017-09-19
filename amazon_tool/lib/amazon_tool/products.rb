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

          products.each_with_index do |product, index|
            new_item = AmazonTool::Items.new
            new_item.index = index
            new_item.category = new_category
            url = "https://www.amazon.com#{product.search('a.a-link-normal').attr('href').text}"
            new_item.url = url
            name_and_rating = product.search('a.a-link-normal').text.split("\n")
            new_item.name = name_and_rating[0].split(" {10,}")
            new_item.rating = "#{name_and_rating[1]}".lstrip
            AmazonTool::Products.price_scrape(new_item)
            @@items[new_category.name] << new_item
          end
      end
   @@items
  end

  def self.price_scrape(new_item)
      pricing = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games/"))
      prices = pricing.search('span.p13n-sc-price')
      prices.each do |price|
            new_item.price = price.text
      end

      binding.pry
  end

  def self.toys_and_games
    scrape_products

    #SCRAPE PRICE
      @@items["Toys & Games"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Toys & Games"][0].name}"
        puts "You can buy yours here - #{@@items["Toys & Games"][0].url}"
        puts "Rating - #{@@items["Toys & Games"][0].rating}"
        puts "Price - #{@@items["Toys & Games"][0].price}"
      when "2"
        puts @@items["Toys & Games"][1]
      when "3"
        puts @@items["Toys & Games"][2]
      when "back"
        "list_products"
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
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
