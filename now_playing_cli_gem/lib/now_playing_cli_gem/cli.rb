class NowPlayingCliGem::CLI

# The program itself
  def call
    menu
  end

# Scraped list of now playing movies that is generated when a user run the program or when they type list
  def list
    puts ""
    puts "Movies now playing in theaters:"
    puts ""
    NowPlayingCliGem::Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
    end
  end

# Scraped data that is returned when a user enters a number
  def print_movie(movie)
    puts ""
    puts "#{movie.name}:"

    puts ""
    puts "IMDB Link: #{movie.link}"
  end

# Prompts that are regenerated if a user enters an unrecognized number or word
  def prompts
    puts ""
    puts "What movie would you like a link for? Please type in the corresponding number."
    puts ""
    puts "Enter list to see a list of the movies again."
    puts ""
    puts "Enter exit to end the program."
    puts ""
  end

# Prompt that is generated once the user types exit
  def goodbye
    puts ""
    puts "See you next time for more now playing movies!"
    puts ""
  end

# Interface prompts
  def menu
    list
    input = nil
    while input != "exit"
      prompts
        input = gets.strip
        if input == "list"
          list
        elsif input.to_i > 0
          if movie = NowPlayingCliGem::Movie.find(input.to_i)
            print_movie(movie)
          end
        end
      end
    goodbye
  end
end
