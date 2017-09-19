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
            new_item.price = new_category.scrape_price(new_item)
            # AmazonTool::Products.price_scrape(new_item)
            @@items[new_category.name] << new_item
          end
      end
   @@items
  end

  def self.toys_and_games  
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Toys & Games"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Toys & Games"][0].name[0]}"
        puts "You can buy yours here - #{@@items["Toys & Games"][0].url}"
        puts "Rating - #{@@items["Toys & Games"][0].rating}"
        puts "Price - #{@@items["Toys & Games"][0].price}"
      when "2"
        puts "#{@@items["Toys & Games"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Toys & Games"][1].url}"
        puts "Rating - #{@@items["Toys & Games"][1].rating}"
        puts "Price - #{@@items["Toys & Games"][1].price}"
      when "3"
        puts "#{@@items["Toys & Games"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Toys & Games"][2].url}"
        puts "Rating - #{@@items["Toys & Games"][2].rating}"
        puts "Price - #{@@items["Toys & Games"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end

  def self.electronics
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Electronics"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Electronics"][0].name[0]}"
        puts "You can buy yours here - #{@@items["Electronics"][0].url}"
        puts "Rating - #{@@items["Electronics"][0].rating}"
        puts "Price - #{@@items["Electronics"][0].price}"
      when "2"
        puts "#{@@items["Electronics"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Electronics"][1].url}"
        puts "Rating - #{@@items["Electronics"][1].rating}"
        puts "Price - #{@@items["Electronics"][1].price}"
      when "3"
        puts "#{@@items["Electronics"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Electronics"][2].url}"
        puts "Rating - #{@@items["Electronics"][2].rating}"
        puts "Price - #{@@items["Electronics"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end

  def self.camera_and_photo
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Camera & Photo"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Camera & Photo"][0].name[0]}"
        puts "You can buy yours here - #{@@items["Camera & Photo"][0].url}"
        puts "Rating - #{@@items["Camera & Photo"][0].rating}"
        puts "Price - #{@@items["Camera & Photo"][0].price}"
      when "2"
        puts "#{@@items["Camera & Photo"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Camera & Photo"][1].url}"
        puts "Rating - #{@@items["Camera & Photo"][1].rating}"
        puts "Price - #{@@items["Camera & Photo"][1].price}"
      when "3"
        puts "#{@@items["Camera & Photo"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Camera & Photo"][2].url}"
        puts "Rating - #{@@items["Camera & Photo"][2].rating}"
        puts "Price - #{@@items["Camera & Photo"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end

  def self.video_games
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Video Games"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Video Games"][0].name[0]}"
        puts "You can buy yours here - #{@@items["Video Games"][0].url}"
        puts "Rating - #{@@items["Video Games"][0].rating}"
        puts "Price - #{@@items["Video Games"][0].price}"
      when "2"
        puts "#{@@items["Video Games"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Video Games"][1].url}"
        puts "Rating - #{@@items["Video Games"][1].rating}"
        puts "Price - #{@@items["Video Games"][1].price}"
      when "3"
        puts "#{@@items["Video Games"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Video Games"][2].url}"
        puts "Rating - #{@@items["Video Games"][2].rating}"
        puts "Price - #{@@items["Video Games"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end

  def self.books
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Books"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Books"][0].name[0]}"
        puts "You can buy yours here - #{@@items["Books"][0].url}"
        puts "Rating - #{@@items["Books"][0].rating}"
        puts "Price - #{@@items["Books"][0].price}"
      when "2"
        puts "#{@@items["Books"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Books"][1].url}"
        puts "Rating - #{@@items["Books"][1].rating}"
        puts "Price - #{@@items["Books"][1].price}"
      when "3"
        puts "#{@@items["Books"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Books"][2].url}"
        puts "Rating - #{@@items["Books"][2].rating}"
        puts "Price - #{@@items["Books"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end

  def self.clothing_shoes_and_jewelry
    puts "Please wait a moment while your information is being gathered."
    scrape_products

      @@items["Clothing, Shoes & Jewelry"].each_with_index do |product, index|
        puts "#{index + 1}. #{product.name[0]} - #{product.price}"
      end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."
    new_response = nil
    while new_response != "back"
      new_response = gets.strip.downcase
      case new_response
      when "1"
        puts "#{@@items["Clothing, Shoes & Jewelry"][0].name[0][0]}"
        puts "You can buy yours here - #{@@items["Clothing, Shoes & Jewelry"][0].url}"
        puts "Rating - #{@@items["Clothing, Shoes & Jewelry"][0].rating}"
        puts "Price - #{@@items["Clothing, Shoes & Jewelry"][0].price}"
      when "2"
        puts "#{@@items["Clothing, Shoes & Jewelry"][1].name[0]}"
        puts "You can buy yours here - #{@@items["Clothing, Shoes & Jewelry"][1].url}"
        puts "Rating - #{@@items["Clothing, Shoes & Jewelry"][1].rating}"
        puts "Price - #{@@items["Clothing, Shoes & Jewelry"][1].price}"
      when "3"
        puts "#{@@items["Clothing, Shoes & Jewelry"][2].name[0]}"
        puts "You can buy yours here - #{@@items["Clothing, Shoes & Jewelry"][2].url}"
        puts "Rating - #{@@items["Clothing, Shoes & Jewelry"][2].rating}"
        puts "Price - #{@@items["Clothing, Shoes & Jewelry"][2].price}"
      when "back"
        puts <<-DOC.gsub /^\s*/, ''
        1.  Show Amazon best sellers, by category.
        2.  Generate Review
        3.  Find Sales Rank of Product
        DOC
      else
        puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
      end
    end
  end


end
