class Applist::CLI
  attr_accessor :name, :category, :link, :desc, :avg_rating
  
  def call
    list_apps
    menu
    goodbye
  end
  
  def list_apps
    @apps = Applist::Apps.popular
    @apps.each.with_index(1) do | app, i |
      puts "#{i}. #{app[:name][0]} in #{app[:category][0]}."
    end
  end

  def menu
    puts "This is a list of the most popular free apps available on the Apple App Store. Please enter the number for the app you would like to view. Type list to see the list again or type exit to leave:"
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      if input.to_i > 0
        the_app = @apps[input.to_i - 1]
        puts "#{the_app[:name][0]} in #{the_app[:category][0]}."
        puts "Average Rating: #{the_app[:avg_rating]}"
        puts "#{the_app[:desc]}"
        puts "Please type the number of the app you are interested in, list to see them again, or exit to leave."
      elsif input == "list"
        list_apps
      else
        puts "Please type the number of the app you are interested in, list to see them again, or exit to leave."
      end
    end
  end
  
  def goodbye
    puts "Lata sucka!"
  end
end