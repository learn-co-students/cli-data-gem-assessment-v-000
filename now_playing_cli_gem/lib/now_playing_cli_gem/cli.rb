# CLI Controller
class NowPlayingCliGem::CLI

# Steps of the program
  def call
    list_movies
    menu
  end

# Scrapped data
  def list_movies
    puts "Movies Now Playing:"
    puts <<-DOC
      1. Maze Runner: The Death Cure (2018) - Young hero Thomas embarks on a mission to find a cure for a deadly disease known as the "Flare" - Rosa Salazar, Thomas Brodie-Sangster, Dylan O'Brien, Kaya Scodelario
      2. Hostiles (2017) - In 1892, a legendary Army captain reluctantly agrees to escort a Cheyenne chief and his family through dangerous territory -  Scott Shepherd, Rosamund Pike, Ava Cooper, Stella Cooper
    DOC
  end

# Interface prompts
  def menu
    input = nil
    while input != "exit"
      puts "Which movie would you like to learn more about, 1 or 2? Type list to see all your options again or type exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on movie 1..."
      when "2"
        puts "More info on movie 2..."
      when "list"
        list_movies
      when "exit"
        puts "See you next time for more now playing movies!!!"
      else
        puts "Sorry, I'm not sure what your asking for."
      end
    end
  end

end
