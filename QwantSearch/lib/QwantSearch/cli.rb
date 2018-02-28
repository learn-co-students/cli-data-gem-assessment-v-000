class QwantSearch::CLI

  def call
    make_a_search = true
    puts "Welcome to QwantSearch"
    while make_a_search == true
      puts "What do you want to search?"
      get_qwant_results(get_user_input)
      menu
      make_a_search = new_request?
      #binding.pry
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
    puts "1 - Result 1"
    puts "2 - Result 2"
    puts "3 - Result 3"
    puts "4 - Result 4"
    puts "6 - Result 6"
  end


  def menu
    puts "Type the number you want to explore, or exit to quit"
    case get_user_input
    when "1"
      puts "Description article 1"
    when "2"
      puts "Description article 2"
    when "3"
      puts "Description article 3"
    when "4"
      puts "Description article 4"
    when "5"
      puts "Description article 5"
    when"exit"
      puts "exit"
      return
    else
      "Selection unclear - please type the number of the article you want to explore or exit."
    end
  end

end
