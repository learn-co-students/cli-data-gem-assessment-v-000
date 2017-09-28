class AmazonTool::Scraper
  #attr_accessor :name, :price, :availability, :url

  def scrape_products
    # define variables
    #@@items = {}
    #products = []
    doc = Nokogiri::HTML(open("https://www.amazon.com/Best-Sellers/zgbs"))

      # scrape for all categories
    categories = doc.search('.zg_homeWidget')

      # iterate through all categories.
      categories.each do |category|
          # instantiating New Category Objects.
        new_category = AmazonTool::Category.new
        new_category.name = category.search('h3').text

          # setting key name within @@items Hash.


          # scrape for all products WITHIN each category.
        products = category.search('.zg_item.zg_homeWidgetItem')

          # counter
        i = 0

          # iterate through all items.
        products.each do |product|

              # instantiating New Item Objects.
            new_item = AmazonTool::Items.new

              # setting index to i value (FOR USE WITH ERROR HANDLING).
            new_item.index = i
            new_item.category = new_category
              # raised error handling. When error is raise, loop will skip to next iteration.
            new_category.add_item(new_item)
            begin
                # scrape for specific Item details.
              url = "https://www.amazon.com#{product.search('a.a-link-normal').attr('href').text}"
              new_item.url = url
              name_and_rating = product.search('a.a-link-normal').text.split("\n")
              new_item.name = name_and_rating[0].split(" {10,}")[0]
              new_item.rating = "#{name_and_rating[1]}".lstrip
              new_item.price = new_category.scrape_price(new_item)
                # bumping counter up by 1
              i+=1
            rescue
                # if error is raised, drop counter by 1 ( Error Will Only Raise If Product Is Not Listed On Amazon Best Sellers
                # => e.g. 1. " " 2. Melissa & Doug Scissor Skills Book 3. Hatchimals
              new_category.remove_last_item
              --i
            next
          end
        end
      end
      # return items hash filled will Categories & Items
  end

  def print_and_scrape_products(category)
    puts "Please wait a moment while your information is being gathered."
      # amazon best sellers are scraped.
    scrape_products

      # the argument passed through is now printed - followed by scraped data.
    puts category
    @@items["#{category}"].each_with_index do |product, index|
      puts "#{index + 1}. #{product.name[0]} - #{product.price}"
    end

      # allows user to select an item by corresponding number.
  #   puts "Type corresponding number for more info, or 'back' to return to the main menu."
  #
  #     # response is set as nil to allow for while loop to function correctly
  #   new_response = nil
  #
  #     # when back is entered, while loop will terminate
  #   while new_response != "back"
  #       # response is turned to lower case to encompass all types of inputs - e.g. BACK, Back, BaCk, back => back
  #     new_response = gets.strip.downcase
  #     case new_response
  #       when "1"
  #           # prints 1st product.
  #         puts "#{@@items["#{category}"][0].name[0]}"
  #         puts "You can buy yours here - #{@@items["#{category}"][0].url}"
  #         puts "Rating - #{@@items["#{category}"][0].rating}"
  #         puts "Price - #{@@items["#{category}"][0].price}"
  #       when "2"
  #           # prints 2nd product.
  #         puts "#{@@items["#{category}"][1].name[0]}"
  #         puts "You can buy yours here - #{@@items["#{category}"][1].url}"
  #         puts "Rating - #{@@items["#{category}"][1].rating}"
  #         puts "Price - #{@@items["#{category}"][1].price}"
  #       when "3"
  #           # prints 3rd product.
  #         puts "#{@@items["#{category}"][2].name[0]}"
  #         puts "You can buy yours here - #{@@items["#{category}"][2].url}"
  #         puts "Rating - #{@@items["#{category}"][2].rating}"
  #         puts "Price - #{@@items["#{category}"][2].price}"
  #       when "back"
  #           # loop ends and prints options for menu
  #         puts <<-DOC.gsub /^\s*/, ''
  #         1.  Show Amazon best sellers, by category.
  #         DOC
  #       else
  #           # if any input is not recognized, the following will be printed.
  #         puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
  #       end
  #     end
  end

end
