# CLI controller
class CoffeeRoasters::CLI

  def call
    list_roasters
    menu
    goodbye
  end

  def list_roasters
    puts "==============="
    puts "Welcome to The 21 best Coffee Roasters in the US"
    puts "==============="
    @roaster = CoffeeRoasters::Roaster.all
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the coffee roaster you'd like more info on:"
      puts "Or type 'list' to see the list of Coffee Roasters:"
      puts "Or type 'exit':"

      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on coffee roaster 1"
      when "2"
        puts "more info on coffee roaster 2"
      when "list"
        list_roasters
      else
        puts "Invalid input. Enter 'list' or 'exit'"
      end
    end #while
  end #def menu

  def goodbye
    puts "Thank you for visiting Coffee Roasters CLI"
  end
end
