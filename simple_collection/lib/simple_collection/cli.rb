#CLI Controller
class CLI

  def call
    puts "Welcome Knitter! What would you like to make today?"
    #scrape_page
    start
  end

  def start
    puts "For garments, please enter 1"
    puts "For accessories, please enter 2"
    puts "To view all patterns, please enter 3"
    input = gets.strip.to_i

    #sourcing code goes here

    puts "Which pattern would you like more information on?"
    input = gets.strip

    #more code here

    #more code here

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
end
