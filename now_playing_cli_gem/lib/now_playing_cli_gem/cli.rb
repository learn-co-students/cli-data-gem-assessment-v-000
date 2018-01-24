class NowPlayingCliGem::CLI

# The program
  def call
    menu
  end

# Scraped data
  def list
    puts ""
    puts "Movies now playing in theaters:"
    puts ""
    NowPlayingCliGem::Movie.all.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name}"
    end
  end

  def print_movie(movie)
    puts ""
    puts "#{movie.name}:"

    puts ""
    puts "Summary: #{movie.summary}"
    puts ""

    puts "Starring: #{movie.stars}"
    puts ""
  end

# Interface prompts
  def menu
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What movie would you more information on? Please type in the name of the movie or the corresponding number."
      puts ""
      puts "Enter list to see a list of the movies again."
      puts ""
      puts "Enter exit to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if movie = NowPlayingCliGem::Movie.find_by_name(input)
          print_movie(movie)
        end
      elsif input.to_i > 0
        if movie = NowPlayingCliGem::Movie.find(input.to_i)
          print_movie(movie)
        end
      end
    end
    puts ""
    puts "See you next time for more now playing movies!"
    puts ""
  end
end
