#Our CLI Controller

class AmazonTool::CLI

  def call
    puts "Welcome to the Amazon Tool"
    menu
    goodbye
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
      puts "Toys & Games:"
    when "2"
      puts "Electronics"
    when "3"
      puts "Camera & Photo"
    when "4"
      puts "Video Games"
    when "5"
      puts "Books"
    when "6"
      puts "Clothing, Shoes & Jewelry"
    when "menu"
      menu
    when "products"
      list_products
    else
      puts "Not sure what you're wanting to do. Type products, or menu"
    end

    @products = AmazonTool::Products.all



  end

  def menu
    puts <<-DOC.gsub /^\s*/, ''
    1.  Show Amazon best sellers, by category.
    2.  Generate Review
    3.  Find Sales Rank of Product
    DOC

    response = nil
    while response != "exit"
        response = gets.strip.downcase
        case response
        when "1"
          list_products
        when "2"
          puts "generate_review"
        when "3"
          puts "sales_rank"
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
