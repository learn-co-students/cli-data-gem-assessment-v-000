#Our CLI Controller

require 'pry'

class AmazonTool::CLI

  def call
    puts "Welcome to the Amazon Tool"
      # provides menu options by running menu function.
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


    new_response = gets.strip
      # case to determine category for products to be printed.
    case new_response
    when "1"
      AmazonTool::Scraper.print_and_scrape_products("Toys & Games")
    when "2"
      AmazonTool::Scraper.print_and_scrape_products("Electronics")
    when "3"
      AmazonTool::Scraper.print_and_scrape_products("Camera & Photo")
    when "4"
      AmazonTool::Scraper.print_and_scrape_products("Video Games")
    when "5"
      AmazonTool::Scraper.print_and_scrape_products("Books")
    when "6"
      AmazonTool::Scraper.print_and_scrape_products("Clothing, Shoes & Jewelry")
      # reverts to menu on call.
    when "menu"
      menu
      # lists products.
    when "products"
      list_products
    else
      puts "Not sure what you're wanting to do. Type products, or menu"
    end
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
