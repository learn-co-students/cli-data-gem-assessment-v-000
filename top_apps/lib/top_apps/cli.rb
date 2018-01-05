#CLI Controller
class TopApps::CLI
  def call
    introduction
    list_categories
    pick_category
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
    puts ""
    puts "Type the number for the category that you would like to see the top apps for or exit:"
    input =""
    while input != "exit"
      input=gets.strip.downcase

      case input
      when "1"
        puts "best_app"
      when "2"
      puts "  entertaining"
      when "3"
        puts "social"
      when "4"
      puts "  daily_helper"
      when "5"
      puts "  innovative"
      when "6"
      puts "  hidden_gem"
      when "7"
        puts "most_popular"
      end
    end
  end

end
