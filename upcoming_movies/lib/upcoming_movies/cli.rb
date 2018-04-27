#class UpcomingMovies::CLI
class CLI
  def call
    puts "Upconing Movies"
  #  UpcomingMovies::Scraper.new.make_comingsoon_movies
    Scraper.new.make_comingsoon_movies
    list_movies
    menu
    "checking menu"
    goodbye
  end

  def list_movies
    puts "Listed Below Are Upcming Movies"
  #  print_top10_movies
    #@movies  =  UpcomingMovies::Movies.today
    #@movies.each.with_index(1)   do |movies, i|
    #  puts "#{i},. #{movies.name} - #{movies.price} #{movies.url}"
    #end
  end

  def menu
    puts "Enter the number of movie you want more information on or type exit to "
    input = nil
    while input != "exit"
      puts "enter the number of movie you want to find more detail on."
      input = gets.strip.downcase

      if input.to_i > 0
         the_movies =  @movies[input.to_i - 1 ]
         puts "#{the_movies.name} - #{the_movies.price} #{the_movies.url}"
      elsif input == "list"
        list_movies
      else
          puts " Not sure what ypu want type list or exit"
      end
    end
  end

  def print_top10_movies
    puts ""
    puts "---------------------- RestauranTop 10 Movies -------------------"
    puts ""
    Movies.all.each.with_index do |movies, index|
      puts "#{index}. #{movies.title}"
    end
  end



  def goodbye
    puts "see you again bye"
  end
end
