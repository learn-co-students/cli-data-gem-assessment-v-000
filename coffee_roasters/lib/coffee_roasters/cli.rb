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
    @roaster = CoffeeRoasters::Roaster.all
    @roaster.each.with_index(1) do |r, i|
      puts "#{i}. #{r.name} - #{r.location}"
    end
    puts "==============="
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the coffee roaster you'd like more info on:"
      puts "Or type 'list' to see the list of Coffee Roasters again:"
      puts "Or type 'exit':"

      input = gets.strip.downcase

      if input.to_i > 0
        the_roaster = @roaster[input.to_i-1]
        puts "#{the_roaster.name} - #{the_roaster.location}"
        puts "==============="
      elsif input == "list"
        list_roasters
      else
        puts "Invalid input. Enter 'list' or 'exit'"
      end #if
    end #while
  end #def menu

  def goodbye
    puts "Thank you for visiting Coffee Roasters CLI"
  end
end
