#CLI Controller
class CLI

  attr_accessor :list

  def call
    puts "Welcome to The Simple Collection by Tin Can Knits!"
    #scrape_page
    start
  end

  def start
    puts "For a list of patterns, please type patterns."
    input = gets.strip
    if input == "patterns"

    print_patterns(list)

    else
      puts "I don't understand your response."
      start
    end

    puts "Which pattern would you like more information on?"
    input = gets.strip

    #more code here

    print_patterns(pattern)

    puts "Would you like to learn about another pattern? Please enter y or n."

    input = gets.strip
    if input == "y"
      start
    elsif input == "n"
      puts "Happy Knitting!"
    else
      puts "Please enter your answer again."
      start
    end
  end

  def scrape_page
    doc = Nokogiri::HTML(open("http://tincanknits.com/thesimplecollection.html"))
    puts doc.css("p")[0]
  end

  def print_patterns(pattern)
    puts "#{pattern.name}"
    puts ""
    puts "Sizing: #{pattern.sizing}"
    puts "Materials: #{pattern.materials}"
    puts "Gauge: #{pattern.gauge}"
    puts "Suggested Needles #{pattern.suggested_needles}"
    puts "Notes: #{pattern.notes}"
    puts ""
    puts "#{pattern.description}"
  end

  def print_patterns(list)
    #puts "Patterns #{list} - #{list+17}"
    #puts ""
    SimpleCollection::Patterns.all.each_with_index(list) do |pattern, index|
      puts "#{index}. #{pattern.name}"
    end
  end
end
