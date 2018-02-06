# CLI Controller
class NowPlayingCliGem::CLI

  # Steps of the program
  def call
    menu
  end

  # Scraped list of now playing movies that is generated when a user run the program or when they type list
  def list_movies
    puts ""
    puts "Movies Now Playing:"
    puts ""
    @movies = NowPlayingCliGem::Movie.today
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
  end

  def prompts
    puts ""
    puts "Which movie would you like to learn more about, 1 or 2?"
    puts ""
    puts "Or you can type list to see all your options again or type exit to end the program."
    puts ""
  end

  # Prompts that are regenerated if a user enters an unrecognized number or word
  def unrecognized
    puts ""
    puts "Sorry, I'm not sure what your asking for."
  end

  # Prompt that is generated once the user types exit
  def exit_program
    puts ""
    puts "See you next time for more now playing movies!!!"
    puts ""
  end

  # Interface prompts
  def menu
    list_movies
    # initializing the input
    input = nil
    while input != "exit"
      prompts
      # Run the input only once rather than forever
      input = gets.strip
        if input.to_i > 0
          # Scraped data that is returned when a user enters a number
          movie = @movies[input.to_i-1]
          puts ""
          puts "#{movie.title}:"
          puts ""
          puts "Summary: #{movie.details}"
          puts ""
          puts "Director: #{movie.director}"
        elsif  input == "list"
          list_movies
        elsif  input == "exit"
          exit_program
        else
          unrecognized
        end
      end
    end

end

#PROGRAM IS WORKING AND COMPLETE
