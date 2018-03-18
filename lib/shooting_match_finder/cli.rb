require 'pry'

class ShootingMatchFinder::CLI

  def start
    list_matches
    menu
    farewell
  end

  def list_matches
    Match.new_from_practiscore
    puts "Here are the matches in your area:"
    Match.show_matches.each.with_index(1){|match, i| puts "#{i}. #{match.name} - #{match.date}"}
    puts "Enter a match number for more info, list to see matches again, or type exit."
  end

  def menu #I really don't like the way this menu is set up. I think I can find a better way to do this.
    input = nil
    while input != "exit"
      input = gets.strip
      if input.downcase == "list"
        list_matches
      elsif input.to_i == 1
        puts "More info on Match 1...."  #This should pull and show more info about a specific match.
      elsif input.to_i == 2
        puts "More info on Match 2...."
      else
        puts "Please enter a match number."
      end
    end
  end

  def farewell
    puts "Come back again for more matches!"
  end

end
