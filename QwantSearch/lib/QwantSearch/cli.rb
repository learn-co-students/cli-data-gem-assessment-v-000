class QwantSearch::CLI

  def call
    puts "Welcome to QwantSearch, what do you want to search today?"
    get_qwant_results(get_user_input)
    menu
  end

  def get_user_input
    user_input = gets.to_s.strip
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
