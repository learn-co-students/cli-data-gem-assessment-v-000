#CLI Controller
class CLI

  def call
    puts "Welcome to The Simple Collection by Tin Can Knits!"
    start
    until goodbye
    start
    end
    puts "Happy Knitting!"
  end

  def start
    puts "For a list of patterns, please type patterns."
    input = gets.strip
    until input == "patterns" 
      puts "I don't understand your response. Please try again."
      input = gets.strip
    end

    list = Scraper.new.scrape_page
    print_patterns(list)

    puts "To see more information about a pattern, please enter its number."
    input = gets.strip.to_i
    until input >= 1 && input <= list.length
      puts "Please enter a valid number from the list."
      input = gets.strip.to_i
    end

    pattern = list[input-1]
    pattern.scrape_pattern
    print_pattern(pattern)
  end

  def goodbye
    puts "Would you like to learn about another pattern? Please enter y or n."

    input = gets.strip
    until input == "n" || input == "y"
      puts "I'm sorry, please try again."
      input = gets.strip
    end
    input == "n"
  end



  def print_pattern(pattern)
    puts "--------------------"
    puts ""
    puts "#{pattern.name}"
    puts ""
    puts "Sizing: #{pattern.size}"
    puts "Materials: #{pattern.materials}"
    puts "Gauge: #{pattern.gauge}"
    puts "Suggested Needles: #{pattern.suggested_needles}"
    puts "Notes: #{pattern.notes}"
    puts ""
    puts "#{pattern.description}"
    puts "--------------------"
    puts ""
  end

  def print_patterns(list)
    list.each_with_index do |pattern, index|
      puts "#{index+1}. #{pattern.name}"
    end
  end

end
