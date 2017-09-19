#Our CLI Controller

require 'pry'

class AmazonTool::CLI

  def call
    puts "Welcome to the Amazon Tool"
    menu
    goodbye
  end

  def review
    AmazonTool::Review.new

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

    case new_response
    when "1"
      AmazonTool::Products.toys_and_games
    when "2"
        AmazonTool::Products.electronics
    when "3"
      AmazonTool::Products.camera_and_photo
    when "4"
      AmazonTool::Products.video_games
    when "5"
      AmazonTool::Products.books
    when "6"
      AmazonTool::Products.clothing_shoes_and_jewelry
    when "menu"
      menu
    when "products"
      list_products
    else
      puts "Not sure what you're wanting to do. Type products, or menu"
    end
  end

  def menu
    puts <<-DOC.gsub /^\s*/, ''
    Type '1' to Show Amazon best sellers, by category.

    MORE FEATURES WILL SOON BE ADDED...
    DOC

    response = nil
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

  def goodbye
    puts "See you next time!!!"
  end

end
