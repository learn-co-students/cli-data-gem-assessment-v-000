#CLI Controller
class TopApps::CLI
  def call
    introduction
    list_categories
    pick_category
    exit_cli
  end

  def introduction
    puts "- - - - - - - - - - - - Best Apps of 2017- - - - - - - - - - - - - -"
    puts ""
    puts "Elegantly and intelligently designed, these apps made lives easier,"
    puts "downtime more fulfilling, and moments online more connected to others."
    puts ""
  end

  def list_categories
    puts "Here they are: Google Play’s Best Apps of 2017."
    puts "1.  Best App"
    puts "2.  Most Entertaining"
    puts "3.  Best Social"
    puts "4.  Best Daily Helper"
    puts "5.  Most Innovative"
    puts "6.  Best Hidden Gem"
    puts "7.  Most Popular"
  end

  def pick_category
    input =""
    while input != "exit"
      puts "Type the number for the category that you would like to see the top apps for, type 'list' to see the categories again, or exit:"
      input=gets.strip.downcase

      case input
      when "1"
        puts "Best App"
        pick_app
      when "2"
        puts "entertaining"
        pick_app
      when "3"
        puts "  social"
        pick_app
      when "4"
        puts "daily_helper"
        pick_app
      when "5"
        puts "innovative"
        pick_app
      when "6"
        puts "hidden_gem"
        pick_app
      when "7"
        puts "most_popular"
        pick_app
      when "list"
      list_categories
    else
      puts "Invalid number, Type the number for the category that you would like to see the top apps for, type 'list' to see the categories again, or exit:"
      end
    end
  end

      def exit_cli
      puts "Thank you trying my Gem!  I hope you found a new app to give a try!"
    end

    def pick_app
      puts "1.  This is th name of the best_app"
      puts "2.  This is th name of the best_app"
      puts "Type the number for the app that you would like to see more information on, 'list' to see the categories again, or exit:"
      input=gets.strip.downcase
      if input=="1"
        puts "here is information about that best app!"
      elsif input=="2"
        puts "here is information about the 2nd best app!"
      end
    end


end
