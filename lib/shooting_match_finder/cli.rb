require 'pry'

class ShootingMatchFinder::CLI

  def start
    list_matches
    menu
    farewell
  end

  def list_matches
    puts "Here are the matches in your area:"
    Match.new_from_practiscore
    puts "#{Match.show_matches[0].name}" #this will eventually change to show the name and date attributes of the Match objects created upon scraping Practiscore.
    #binding.pry
    puts "Enter a match number for more info, list to see matches again, or type exit."
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip
      if input.downcase == "list"
        list_matches
      elsif input.to_i == 1
        puts "#{Match.show_matches[0].name}"  #This should pull and show more info about a specific match.
      elsif input.to_i == 2
        puts "2. SUPS Practical Pistol - Date"
      else
        puts "Please enter a match number."
      end
    end
  end

  def farewell
    puts "Come back again for more matches!"
  end

end
