require_relative '../Gemini'

class Gemini::CLI

  def call
    make_a_search = true
    puts "Welcome to Gemini"
    while make_a_search == true
      query_website_data
      menu
      make_a_search = new_request?
    end
  end



  def menu
    puts "The available pairs are:"
    @query.display_pairs
    puts "What pair do you want to check?"
    input = get_user_input
    if input.to_i > 0 && input.to_i <= @query.number_of_results
      @query.display_percentage_and_variations(input)
    elsif input == "exit"
      return
    else
      puts "Selection unclear - please type the number of the article you want to explore or exit."
      menu
    end
  end



  def query_website_data
    @query = Gemini::Scrapper.new
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



  def get_user_input
    gets.to_s.strip
  end

end
