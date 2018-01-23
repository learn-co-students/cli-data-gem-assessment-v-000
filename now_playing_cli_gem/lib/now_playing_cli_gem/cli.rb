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
    @movies = NowPlayingCliGem::Movie.today
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} - #{movie.details} - #{movie.stars}"
    end
  end

  # Interface prompts
  def menu
    input = nil
    while input != "exit"
      puts "Which movie would you like to learn more about, 1 or 2? Type list to see all your options again or type exit."
      input = gets.strip.downcase

      if input.to_i > 0
        the_movie = @movies[input.to_i-1]
        puts "#{the_movie.title} - #{the_movie.details} - #{the_movie.stars}"
      elsif  input == "list"
        list_movies
      elsif  input == "exit"
        puts "See you next time for more now playing movies!!!"
      else
        puts "Sorry, I'm not sure what your asking for."
      end
    end
  end

end
