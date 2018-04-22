class UpcomingMovies::CLI
  def call
    puts "Upconing Movies"
    list_movies
    menu
    "checking menu"
    goodbye
  end

  def list_movies
    puts "Listed Below Are Upcming Movies"
    @movies  =  UpcomingMovies::Movies.today
    puts @movies
  end

  def menu
    puts "Enter the number of movie you want more information on or type exit to "
    input = nil
    while input != "exit"
      puts "enter the number of movie you want to find more detail on."  
      input = gets.strip.downcase
      
      if input.to_i > 0
         puts @movies[input.to_i - 1 ]
      elsif input == "list"
        list_movies
      else
          puts " Not sure what ypu want type list or exit"
      end
    end
  end

  def goodbye
    puts "see you again bye"
  end
end
