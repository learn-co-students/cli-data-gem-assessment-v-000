require_relative '../Gemini'

class Gemini::CLI

  def call
    make_a_search = true
    puts "Welcome to Gemini"
    while make_a_search == true
      menu
      query_website_data
      make_a_search = new_request?
    end
  end



  def menu
    puts "The available pairs are:"
    puts "1 - BTC/USD"
    puts "2 - ETH/USD"
    puts "3 - ETH/BTC"
    puts "What pair do you want to check?"
  end



  def query_website_data
    @query = Gemini::Scrapper.new
    #@query.scrap_website
    @query.display_results
  end

  def new_request?
    puts "Do you want to check another price? (Y/N)"
    user_input = get_user_input.downcase
    case user_input
    when "y"
      true
    when "n"
      false
    else puts "selection_unclear - please type Y or N"
      new_request?
    end
  end

end
