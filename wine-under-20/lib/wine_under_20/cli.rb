class WineUnder20::CLI

  def call
    puts "Find today's wines under $20 near you! What's your zip code?"
    input = gets.chomp
    list_wines
    menu
  end

  def list_wines
    puts <<-DOC
1. Dreaming Tree Wine - $19
2. Trader Joe's 2 buck chuck - $13
3. adfasdfasdf
    DOC
  end

  def menu
    puts "Enter the number of the deal you'd like more information on or type exit to leave."
    while input != "exit"
    input = gets.strip
    case input
    when "1"
      puts "More info on deal 1..."
    when "2"
      puts "More info on deal 2..."
    when "3"
      puts "More info on deal 3..."
    end
  end
  end

end
