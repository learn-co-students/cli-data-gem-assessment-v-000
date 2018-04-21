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
#    @movies  =  UpcomingMovies::Movies.today
  end

  def menu
    puts "Enter the number of movie you want more information on or type exit to "
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts   "More info on movie 1"
      when "2"
       puts  "More info on movie 2"
     when "list"
        list_movies
      else
        "please type list or exit  "
      end
    end
  end

  def goodbye
    puts "see you again bye"
  end
end
