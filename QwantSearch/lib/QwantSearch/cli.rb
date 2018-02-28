require_relative '../QwantSearch'

class QwantSearch::CLI

  def call
    make_a_search = true
    puts "Welcome to QwantSearch"
    while make_a_search == true
      puts "What do you want to search?"
      get_qwant_results(get_user_input)
      menu
      make_a_search = new_request?
    end
  end

  def get_user_input
    user_input = gets.to_s.strip
  end

  def new_request?
    puts "Do you want to make another search? (Y/N)"
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

  def get_qwant_results(input)
    puts "Here are the top results:"
    @search = QwantSearch::Scrapper.new
    @search.results(input)
  end


  def menu
    puts "Type the number you want to explore, or exit to quit"
    input = get_user_input
    if input.to_i > 0 && input.to_i <= @search.number_of_results
      @search.description(input)
    elsif input == "exit"
      return
    else
      "Selection unclear - please type the number of the article you want to explore or exit."
    end
  end

end
