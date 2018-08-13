class Applist::CLI
  attr_accessor :name, :category, :link, :desc, :avg_rating
  
  def call
    list
    menu
    goodbye
  end
  
  def list 
    apps = Applist::Apps.all
    apps.each.with_index(1) do |app, i|
      puts "#{i}. #{app.name} in #{app.category}"
      break if i == 100
    end
  end 

  def menu
    puts "This is a list of the most popular free apps available on the Apple App Store. Please enter the number for the app you would like to view. Type list to see the list again or type exit to leave:"
    input = nil
    while input != "exit"
    input = gets.strip.downcase
      if input.to_i > 0
        apps = Applist::Apps.all
        the_app = apps[input.to_i - 1]
        
        puts "#{the_app.name} in #{the_app.category}."
        puts "Average Rating: #{the_app.avg_rating}"
        puts "#{the_app.desc}"
        puts "Please type the number of the app you are interested in, list to see them again, or exit to leave."
      
      elsif input == "list"
        list
      else
        puts "Please type the number of the app you are interested in, list to see them again, or exit to leave."
      end
    end
  end
  
  def goodbye
    puts "Please return later for the newest apps"
  end
end