#Our CLI Controller

require 'pry'

class AmazonTool::CLI

  def call

    puts "Welcome to the Amazon Tool"
      # provides menu options by running menu function.
    scraper = AmazonTool::Scraper.new
    scraper.scrape_products


    menu
      # goodbye message.
    puts "See you next time!!!"
  end

  def list_products
    puts <<-DOC.gsub /^\s*/, ''
      Please select category:
      1. Toys & Games
      2. Electronics
      3. Camera & Photo
      4. Video Games
      5. Books
      6. Clothing, Shoes & Jewelry
    DOC

      # instantiates New Scraper
    new_response = gets.strip

      # case to determine category for products to be printed.
    category = AmazonTool::Category.all[new_response.to_i - 1]


    puts category.name
    category.items.each.with_index(1) do |item, index|
      puts "#{index}. #{item.name} - #{item.price}."
    end

    puts "Type corresponding number for more info, or 'back' to return to the main menu."

      # response is set as nil to allow for while loop to function correctly
    new_response = nil

      # when back is entered, while loop will terminate
    while new_response != "back"
        # response is turned to lower case to encompass all types of inputs - e.g. BACK, Back, BaCk, back => back
      new_response = gets.strip.downcase
      case new_response
        when "1"
          current_item = nil
          category.items.each do |items|
            if items.index == 0
              print_current_item(items)
            else
              next
            end
          end
        when "2"
          current_item = nil
          category.items.each do |items|
            if items.index == 1
              print_current_item(items)
            else
              next
            end
          end
        when "3"
          current_item = nil
          category.items.each do |items|
            if items.index == 2
              print_current_item(items)
            else
              next
            end
          end
        when "back"
            # loop ends and prints options for menu
          puts <<-DOC.gsub /^\s*/, ''
          1.  Show Amazon best sellers, by category.
          DOC
        else
            # if any input is not recognized, the following will be printed.
          puts "I'm sorry, I didn't catch that! Type corresponding number for more info, or 'back' to return to the main menu."
        end
      end

    #binding.pry
  end

  def print_current_item(current_item)
    puts "#{current_item.name}"
    puts "You can buy yours here - #{current_item.url}"
    puts "Rating - #{current_item.rating}"
    puts "Price - #{current_item.price}"
  end

  def menu
    puts "Type '1' to Show Amazon best sellers, by category."
    puts "MORE FEATURES WILL SOON BE ADDED..."
      # to allow while loop to function correctly.
    response = nil
      # loops until exit input.
    while response != "exit"
      response = gets.strip.downcase
      case response
        when "1"
          list_products
        when "menu"
          menu
        else
          puts "Not sure what you're wanting to do. Type Menu, or Exit"
      end
    end
  end
end
