#class NowPlayingCliGem::CLI
#
## The program
#  def call
#    menu
#  end
#
## Scraped data
#  def list
#    puts ""
#    puts "Movies now playing in theaters:"
#    puts ""
#    NowPlayingCliGem::Movie.all.each.with_index(1) do |movie, i|
#      puts "#{i}. #{movie.name}"
#    end
#  end
#
#  def print_movie(movie)
#    puts ""
#    puts "#{movie.name}:"
#
#    puts ""
#    puts "Summary: #{movie.summary}"
#    puts ""
#
#    puts "Starring: #{movie.stars}"
#  end
#
## Interface prompts
#  def menu
#    list
#    input = nil
#    while input != "exit"
#      puts ""
#      puts "What movie would you more information on? Please type in the name of the movie or the corresponding number."
#      puts ""
#      puts "Enter list to see a list of the movies again."
#      puts ""
#      puts "Enter exit to end the program."
#      puts ""
#      input = gets.strip
#      if input == "list"
#        list
#      elsif input.to_i == 0
#        if movie = NowPlayingCliGem::Movie.find_by_name(input)
#          print_movie(movie)
#        end
#      elsif input.to_i > 0
#        if movie = NowPlayingCliGem::Movie.find(input.to_i)
#          print_movie(movie)
#        end
#      end
#    end
#    puts ""
#    puts "See you next time for more now playing movies!"
#    puts ""
#  end
#end




# CLI Controller
class NowPlayingCliGem::CLI

  # Steps of the program
  def call
    list_movies
    menu
  end

  # Scraped data
  def list_movies
    puts ""
    puts "Movies Now Playing:"
    puts ""
    @movies = NowPlayingCliGem::Movie.all.each.with_index(1) do |movie, i|
    # @movies.all.each.with_index(1) do |movie, i|
    # The code how it is above or both the peices below - need to decide what is best
    # @movies = NowPlayingCliGem::Movie.today
    # @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name} - #{movie.summary} - #{movie.stars}"
    end
    puts ""
  end

  # Interface prompts
  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Which movie would you like to learn more about, 1 or 2?"
      puts ""
      puts "Or you can type list to see all your options again or type exit to end the program."
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0
        the_movie = @movies[input.to_i-1]
        puts "#{the_movie.name} - #{the_movie.summary} - #{the_movie.stars}"
      elsif  input == "list"
        list_movies
      elsif input == "exit"
        puts "See you next time for more now playing movies!!!"
      else
        puts "Sorry, I'm not sure what your asking for."
      end
    end
  end

end
