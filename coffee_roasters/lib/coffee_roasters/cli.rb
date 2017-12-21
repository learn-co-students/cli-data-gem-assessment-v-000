# CLI controller
class CoffeeRoasters::CLI

  def call
    list_roasters
    menu
    goodbye
  end

  def list_roasters
    puts "Welcome to The 21 best Coffee Roasters in the US"
    puts <<~HEREDOC
      1. Blue Bottle
      2. Camber
    HEREDOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the roaster you'd like more info on:"
      puts "Or type 'exit':"

      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on coffee roaster 1"
      when "2"
        puts "more info on coffee roaster 2"
      else
        list_roasters
      end
    end #while
  end #menu

  def goodbye
    puts "Thank you for visiting Coffee Roasters CLI"
  end
end
